PWD:=$(shell pwd)
RUNCOMS_DIR:=${PWD}/prezto/runcoms


prezto_unlink:
	cd ~/ && rm -fr .zshenv .zlogin .zprofile .zpreztorc .zprezto

prezto_link: prezto_unlink
	ln -s ${RUNCOMS_DIR}/zshenv ${HOME}/.zshenv
	ln -s ${RUNCOMS_DIR}/zlogin ${HOME}/.zlogin
	ln -s ${RUNCOMS_DIR}/zprofile ${HOME}/.zprofile
	ln -s ${PWD}/prezto ${HOME}/.zprezto
	ln -s ${PWD}/zpreztorc ${HOME}/.zpreztorc

prezto_contrib:
	cd ${HOME} && \
	git clone https://github.com/belak/prezto-contrib .zprezto-contrib && \
	cd .zprezto-contrib && \
	git submodule update --init

autoenv:
	cd ${HOME} && \
	git clone git://github.com/kennethreitz/autoenv.git .autoenv

