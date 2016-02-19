---Using the Linux Script---

The LinuxBuildPackage.sh script will do the following things:
1. Build a release of MissionPlanner in the ~/Documents directory
2. Create a .deb debian package in the ~/Documents directory
3. Run the lintian checker to check for any errors in the package. A report is output at ~/Documents/report.txt

Using the debian package:
Due to this package not being an "official" Ubuntu/Debian/etc package, the installation process is a little convoluted for the first install. This is due to any dependencies not being able to be automatically installed alongside APM Planner.

If installing for the first time:
sudo dpkg -i missionplanner-XXX.deb
sudo apt-get install -f
sudo dpkg -i missionplanner-XXX.deb

If upgrading:
sudo dpkg -i missionplanner-XXX.deb

If uninstalling:
sudo dpkg -r missionplanner
