#!/bin/bash
FLATPACK_EXPORTS_APP=/var/lib/flatpak/exports/share/applications
# VSCode.oss, flatpak'ed
sudo sed -i -e 's/Icon=com.visualstudio.code.oss/Icon=eclipse/g' $FLATPACK_EXPORTS_APP/com.visualstudio.code.oss.desktop
# Firefox Dev, flatpak'ed
sudo sed -i -e 's/Icon=org.mozilla.FirefoxDevEdition/Icon=firefox/g' $FLATPACK_EXPORTS_APP/org.mozilla.FirefoxDevEdition.desktop
# Slack, flatpak'ed
sudo sed -i -e 's/Icon=com.slack.Slack/Icon=slack/g' $FLATPACK_EXPORTS_APP/com.slack.Slack.desktop
# Discord, flatpak'ed
sudo sed -i -e 's/Icon=com.discordapp.Discord/Icon=turpial/g' $FLATPACK_EXPORTS_APP/com.discordapp.Discord.desktop

# Telegram
sudo sed -i -e 's/Icon=telegram-desktop/Icon=telegram/g' /usr/share/applications/telegram-desktop.desktop
