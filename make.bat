@echo off
mkdir temp
xcopy /E /I css temp\css\
xcopy /E /I img temp\img\
xcopy /E /I options temp\options\
xcopy /E /I scripts temp\scripts\
xcopy /E /I changelog temp\changelog\
copy changelog\background.js temp\background.js
copy manifest.json temp\
cd temp
powershell Compress-Archive -Path * -DestinationPath ..\biliscope.zip -Force
cd ..
rmdir /S /Q temp
