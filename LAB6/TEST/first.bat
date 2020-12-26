@echo off
systeminfo | findstr /B /C:"OS Version" > "InfoAboutOSVersion.txt"
wmuc os get FreePhysicalMemory > "FreeMemory.txt"
wmic os get TotalVisibleMemorySize > "UsedMemory.txt"
wmic logicaldisk list brief > "Disk.txt"