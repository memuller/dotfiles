#!/bin/bash
FLATPACK_EXPORTS_APP=/var/lib/flatpak/exports/share/applications
sudo sed -i -e 's/Icon=com.visualstudio.code.oss/Icon=eclipse/g' $FLATPACK_EXPORTS_APP/com.visualstudio.code.oss.desktop

sudo sed -i -e 's/Icon=org.mozilla.FirefoxDevEdition/Icon=firefox/g' $FLATPACK_EXPORTS_APP/org.mozilla.FirefoxDevEdition.desktop
