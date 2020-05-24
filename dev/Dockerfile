FROM alpine:3.9.6

RUN apk add --no-cache \
		bash \
		build-base \
		ctags \
		curl \
		diffutils \
		findutils \
		g++ \
		git \
		make \
		man \
		ncurses-dev \
		openssh \
		py3-pip \
		python3 \
		tmux \
		vim

# RUN git clone --depth 1 https://github.com/vim/vim.git /tmp/vim \
# 		&& ( cd /tmp/vim && ./configure 
# 						--with-features=huge \
#             --enable-multibyte \
#             --enable-python3interp=yes \
#             --with-python3-config-dir=$(python3-config --configdir) \
#             --disable-gui \
#             --disable-netbeans \
# 		&& make install )

RUN ln -s $(which python3) /usr/bin/python; ln -s $(which pip3) /usr/bin/pip

RUN pip install \
    beautifulsoup4 \
    requests

RUN rc-update add sshd \
		&& rc-status \
		&& /etc/init.d/sshd start

