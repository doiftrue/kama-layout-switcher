
Useful links
------------

- https://forum.ubuntu.ru/index.php?topic=271377.0
- xdotool keycodes: https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes


Notes
-----

You can find correct names for keyboard keys by using the following command:

   $ xev

A small window will open. Keep it focused, then press any key. You will get the name of the key in terminal output.


xdolool
-------
     key list: https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes


g3kb-switch
-----------

See: https://github.com/lyokha/g3kb-switch

Ensure that `G3kbSwitch Gnome Shell extension` is instaled on your system.

Install:

	$ mkdir ./__temp && cd __temp/
	$ git clone --depth 1 git@github.com:lyokha/g3kb-switch.git
	$ cd g3kb-switch/
	$ mkdir build && cd build
	$ sudo apt install cmake
	$ cmake ..
	$ make
	$ sudo make install

Install the project...

	-- Install configuration: ""
	-- Installing: /usr/share/bash-completion/completions/g3kb-switch
	-- Installing: /usr/share/zsh/site-functions/_g3kb-switch
	-- Installing: /usr/local/bin/g3kb-switch
	-- Installing: /usr/local/lib/libg3kbswitch.so
	-- Installing: /usr/local/share/pkgconfig/g3kb-switch.pc
	-- Installing: /usr/local/share/man/man1/g3kb-switch.1.gz

Now we need install `G3kbSwitch Gnome Shell extension`:

	$ cd ../extension
	$ make install  # no sudo required!

Restart Gnome Shell for changes to take effect. Better restart PC.

To check if `G3kbSwitch Gnome Shell extension` is installed:

	gnome-extensions info g3kb-switch@g3kb-switch.org
	gnome-extensions enable g3kb-switch@g3kb-switch.org


Usage:

    g3kb-switch [-p]      Show the current layout group
    g3kb-switch -l        Show available layout groups
    g3kb-switch -n        Switch to the next layout group
    g3kb-switch -s ARG    Switch to layout group ARG
    g3kb-switch -h        Show this message and exit
    g3kb-switch -v        Show the program version and exit


### Notes

If you just install the Ubuntu you need to install the `gnome-shell-extension`

	sudo apt install gnome-shell-extension-manager


