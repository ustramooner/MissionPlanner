

rm ExtLibs/BSE.Windows.Forms/Properties/Resources.resources 2>/dev/null
rm ExtLibs/BSE.Windows.Forms/XPander/Panel.resources 2>/dev/null
rm ExtLibs/BSE.Windows.Forms/XPander/XPanderPanel.resources 2>/dev/null
rm ExtLibs/BSE.Windows.Forms/XPander/XPanderPanelList.resources 2>/dev/null
rm ExtLibs/GMap.NET.Core/Properties/Resources.resources 2>/dev/null
rm ExtLibs/GMap.NET.Core/Resources/Strings.resources 2>/dev/null
rm ExtLibs/GMap.NET.Core/Resources/Strings.zh-Hans.resources 2>/dev/null
rm ExtLibs/GMap.NET.WindowsForms/GMap.NET.WindowsForms/TilePrefetcher.resources 2>/dev/null
rm ExtLibs/GMap.NET.WindowsForms/Properties/Resources.resources 2>/dev/null
rm ExtLibs/GeoUtility/Properties/Resources.resources 2>/dev/null
rm ExtLibs/Utilities/Properties/Resources.resources 2>/dev/null
rm ExtLibs/ZedGraph/ZedGraph/ZedGraphControl.resources 2>/dev/null
rm ExtLibs/ZedGraph/ZedGraph/ZedGraphLocale.resources 2>/dev/null
rm GCSViews/ConfigurationView/ConfigAteryxSensors.resources 2>/dev/null
rm GCSViews/FlightData.zh-TW.resources 2>/dev/null
rm GCSViews/FlightPlanner.zh-TW.resources 2>/dev/null
rm Updater/Properties/Resources.resources 2>/dev/null
rm wix/Properties/Resources.resources 2>/dev/null

find . -name bin | grep -v NumpyDotNet | xargs rm -rf
find . -name obj | xargs rm -rf

exit 0

