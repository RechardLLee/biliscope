.PHONY: all
all:
	make chrome
	make firefox

.PHONY: chrome
chrome:
	mkdir -p temp
	cp -r css img options scripts changelog manifest.json temp/
	cp changelog/background.js temp/background.js
	cd temp && zip -r ../biliscope_chrome.zip *
	rm -rf temp

.PHONY: firefox
firefox:
	mkdir -p temp
	cp manifest.json manifest-template.json
	node tools/convertManifest.js manifest.json
	cp -r css img options scripts changelog manifest.json temp/
	cp changelog/background.js temp/background.js
	cd temp && zip -r ../biliscope_firefox.zip *
	mv manifest-template.json manifest.json
	rm -rf temp
