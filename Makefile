PWD:=$(shell pwd)
RUNCOMS_DIR:=${PWD}/prezto/runcoms


prezto_unlink:
	cd ~/ && rm -fr .zshenv .zlogin .zprofile .zpreztorc .zprezto

prezto_link: prezto_unlink
	ln -s ${RUNCOMS_DIR}/zshenv ${HOME}/.zshenv
	ln -s ${RUNCOMS_DIR}/zlogin ${HOME}/.zlogin
	ln -s ${RUNCOMS_DIR}/zprofile ${HOME}/.zprofile
	ln -s ${PWD}/prezto ${HOME}/.zprezto
	ln -s ${PWD}/shell/zpreztorc ${HOME}/.zpreztorc

prezto_contrib:
	cd ${HOME} && \
	git clone https://github.com/belak/prezto-contrib .zprezto-contrib && \
	cd .zprezto-contrib && \
	git submodule update --init

autoenv:
	cd ${HOME} && \
	git clone git://github.com/kennethreitz/autoenv.git .autoenv

unlink_dotfiles:
	cd ~/ && rm -fr .gitconfig .gitignore .zshrc 
link_configs:
	ln -s ${PWD}/gitignore ${HOME}/.gitignore
	ln -s ${PWD}/gitconfig ${HOME}/.gitconfig
	ln -s ${PWD}/zshrc ${HOME}/.zshrc

