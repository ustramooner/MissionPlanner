#!/bin/bash

xbuild /property:DefineConstants=SQLite,MONO,noDIRECTX /p:Configuration=Release ArdupilotMega.sln

