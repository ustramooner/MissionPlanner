#!/bin/bash
set -e

HOME_DIR=$0
HOME_DIR=$(dirname $HOME_DIR)
HOME_DIR=$(cd $HOME_DIR && pwd)
HOME_DIR=$(dirname $HOME_DIR)
cd $HOME_DIR

TARGET_DIR=$HOME_DIR/release

NOW=$(date +"%Y%m%d")
GIT_VERSION=$(git describe --abbrev=0)
GIT_VERSION=${GIT_VERSION#MissionPlanner}
VERSION_DIR=$TARGET_DIR/MissionPlanner_$GIT_VERSION

install -d $VERSION_DIR/usr/lib/missionplanner

#build MissionPlanner
xbuild /property:OutputPath=$VERSION_DIR/usr/lib/missionplanner /property:DefineConstants=SQLite,MONO,noDIRECTX /p:Configuration=Release ArdupilotMega.sln

chmod go-w -R $VERSION_DIR/usr/lib/missionplanner


#copy deb support files
install -m 644 -D ./debian/control $VERSION_DIR/DEBIAN/control
install -m 755 -D ./debian/postinst $VERSION_DIR/DEBIAN/postinst
install -m 755 -D ./debian/postrm $VERSION_DIR/DEBIAN/postrm
install -m 644 -D ./debian/copyright $VERSION_DIR/usr/share/doc/missionplanner/copyright
install -m 644 -D ./debian/changelog $VERSION_DIR/usr/share/doc/missionplanner/changelog
install -m 644 -D ./debian/MissionPlanner.desktop $VERSION_DIR/usr/share/applications/missionplanner.desktop
install -m 644 -D ./debian/MissionPlanner $VERSION_DIR/usr/share/menu/missionplanner
rm $VERSION_DIR/usr/share/doc/missionplanner/changelog.gz || true
gzip -9 $VERSION_DIR/usr/share/doc/missionplanner/changelog

#remove unused files
rm -rf $VERSION_DIR/usr/lib/missionplanner/Drivers
#these fail lintian
rm $VERSION_DIR/usr/lib/missionplanner/Lib/cgi.py
rm $VERSION_DIR/usr/lib/missionplanner/Lib/site-packages/scipy/special/utils/makenpz.py
rm $VERSION_DIR/usr/lib/missionplanner/licence.rtf

#install icons
install -D -m 644 ./mpdesktop.ico $VERSION_DIR/usr/share/icons/hicolor/32x32/apps/missionplanner.png

#set version
sed -i "s/VERSION/$GIT_VERSION/g" $VERSION_DIR/DEBIAN/control

#set INSTALLED_SIZE
INSTALLED_SIZE=$(du -c release/MissionPlanner_1.3.99999|tail --lines=1| awk '{ print $1 }')
INSTALLED_SIZE=$(expr $INSTALLED_SIZE / 1024)
sed -i "s/INSTALLED_SIZE/$INSTALLED_SIZE/g" $VERSION_DIR/DEBIAN/control

#create the pacakge and check compliance (report.txt)
fakeroot dpkg-deb -b $VERSION_DIR
lintian $VERSION_DIR.deb --fail-on-warnings |tee $VERSION_DIR.report.txt

echo -e "\n\nSuccess!!!"

