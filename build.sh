#!/bin/bash

#copy speach librayr in - otherwise first build fails
mkdir bin/Release/ ; cp ./ExtLibs/System.Speech.dll bin/Release/System.Speech.dll

#build with xbuild
xbuild /property:DefineConstants=SQLite,MONO,noDIRECTX /p:Configuration=Release ArdupilotMega.sln

