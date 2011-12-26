
IFL Wallpaper
========================================

grab and set the lastest interfacelift.com wallpaper as a gnome background

Install
----------------------------------------

	git clone https://stombi@github.com/stombi/iflwallpaper.git
	cd iflwallpaper/
	./install.sh

Usage
----------------------------------------

You can search for iflwallpaper in Gnome Shell or Unity or type in a terminal

	iflwallpaper

Or

	~/bin/iflwallpaper

if ~/bin is not in your $PATH

You can also type

	iflwallpaper conf
	
to edit the config file or right clic the icon in the Unity launcher

There you can choose the user agent, desktop and resolution.


Files location
----------------------------------------

	~/bin/iflwallpaper : the script itself
	~/.local/share/applications/iflwallpaper.desktop : .desktop file
	~/.local/share/icons/iflwallpaper.svg : application icon

Data location
----------------------------------------

	~/.local/share/iflwallpaper : data directory
	~/.local/share/iflwallpaper/config : config file
	~/.local/share/iflwallpaper/wallpaper.jpg : the wallpaper image
	~/.local/share/iflwallpaper/wallpaper.last : URL of last downloaded wallpaper
