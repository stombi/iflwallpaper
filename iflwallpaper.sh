#!/bin/bash
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.

USER_AGENT="Mozilla/5.0 (X11; U; Linux i686; fr; rv:1.9.1.1) Gecko/20090715 Firefox/3.5.1"
FEED_URL="http://feeds.feedburner.com/InterfaceliftNewestWallpaper"
RESOLUTION="1920x1200"
BG_PATH="$HOME/wallpaper.jpg"
TMP_PATH="$HOME/wallpaper.tmp"
LAST_WALL="$HOME/wallpaper.last"
# GNOME 2
SET_BG="gconftool-2 -t string -s /desktop/gnome/background/picture_filename $BG_PATH"
# GNOME 3
# SET_BG="gsettings set org.gnome.desktop.background picture-uri 'file://$BG_PATH'"

function get_wall_filename {
	wget -U "${USER_AGENT}" -q -O- ${FEED_URL} | grep -P -o 'http://*[^:]*\.jpg' | head -n1 | sed -e 's/previews/7yz4ma1/g' | sed -e 's/\.jpg/_'${RESOLUTION}'\.jpg/g'
}
function save_wall_filename {
	echo ${1} > ${LAST_WALL}
}
function get_last_filename {
	cat ${LAST_WALL}
}
function download_wallpaper {
	wget -U "${USER_AGENT}" -O ${TMP_PATH} ${1}
	mv ${TMP_PATH} ${BG_PATH}
}

NEW=$(get_wall_filename)

if [ ${NEW} != $(get_last_filename) ] 
then 
	download_wallpaper "${NEW}"
	save_wall_filename "${NEW}"
	${SET_BG}
fi 
