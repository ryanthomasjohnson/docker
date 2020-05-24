FROM alpine:3.9.6

RUN apk add --no-cache \
		diffutils \
		findutils \
    bash \
    build-base \
    ctags \
    curl \
    g++ \
    git \
    make \
    man \
    ncurses-dev \
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

RUN git clone https://github.com/ryanthomasjohnson/dotfiles.git /dotfiles \
    && (cd /dotfiles && ./install.sh)

