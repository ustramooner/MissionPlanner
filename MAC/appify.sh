#!/bin/bash
set -e
set -x

HOME_DIR=$0
HOME_DIR=$(dirname $HOME_DIR)
HOME_DIR=$(dirname $HOME_DIR)

INPUT=$HOME_DIR/MAC
TARGET=$INPUT/output
BUILD_DIR=$HOME_DIR/bin/Release
VERSION=$(git describe | sed 's/MissionPlanner//')


rm -rf $TARGET
mkdir $TARGET
macpack -r $INPUT/icon.icns -o $TARGET -icon $INPUT/icons.icns -n "MissionPlanner" $BUILD_DIR/MissionPlanner.exe
rsync -Pav $BUILD_DIR/* "$TARGET/MissionPlanner.app/Contents/Resources/"

cat <<EOF >"$TARGET/MissionPlanner.app/Contents/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleIdentifier</key>
	<string>MissionPlanner</string>
	<key>CFBundleExecutable</key>
	<string>MissionPlanner</string>
	<key>CFBundleIconFile</key>
	<string>icon.icns</string>
</dict>
</plist>
EOF

cp $INPUT/appify.DS_Store $TARGET/.DS_Store
ln -s /Applications $TARGET/Applications
mv $TARGET/MissionPlanner.app "$TARGET/Mission Planner.app"
hdiutil create -fs HFS+ -srcfolder $TARGET -volname "Mission Planner" "MissionPlanner_${VERSION}.dmg"

