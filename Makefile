PWD:=$(shell pwd)
RUNCOMS_DIR:=${PWD}/prezto/runcoms


# Links prezto files and its main dir
prezto_unlink:
	cd ~/ && rm -fr .zshenv .zlogin .zprofile .zpreztorc .zprezto
prezto_link: prezto_unlink
	ln -s ${RUNCOMS_DIR}/zshenv ${HOME}/.zshenv
	ln -s ${RUNCOMS_DIR}/zlogin ${HOME}/.zlogin
	ln -s ${RUNCOMS_DIR}/zprofile ${HOME}/.zprofile
	ln -s ${PWD}/prezto ${HOME}/.zprezto
	ln -s ${PWD}/shell/zpreztorc ${HOME}/.zpreztorc

# Installs prezto config repos
prezto_contrib:
	cd ${HOME} && \
	git clone https://github.com/belak/prezto-contrib .zprezto-contrib && \
	cd .zprezto-contrib && \
	git submodule update --init

# Installs autoenv
autoenv:
	cd ${HOME} && \
	git clone git://github.com/kennethreitz/autoenv.git .autoenv

# Links basic git and bash files
unlink_configs:
	cd ~/ && rm -fr .gitconfig .gitignore .zshrc 
link_configs: unlink_configs
	ln -s ${PWD}/gitignore ${HOME}/.gitignore
	ln -s ${PWD}/gitconfig ${HOME}/.gitconfig
	ln -s ${PWD}/zshrc ${HOME}/.zshrc

# Links gnome autostart and shortcuts stuff
unlink_gnome:
	rm -fr ${HOME}/.local/share/applications ${HOME}/.config/autostart
link_gnome: unlink_gnome
	ln -s ${PWD}/gnome/local/share/applications ${HOME}/.local/share/applications
	ln -s ${PWD}/gnome/config/autostart ${HOME}/.config/autostart
