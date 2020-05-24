FROM alpine:3.9.6

RUN apk add --no-cache \
		clang \
		clang \
		clang-libs \
		findutils \
		gcc \
		gcompat \
		perl-dev \
    bash \
    build-base \
    cmake \
    ctags \
    curl \
    g++ \
    git \
    go \
    llvm \
    make \
    man \
    ncurses-dev \
    perl \
    py3-pip \
    python3 \
    python3-dev \
    tmux

RUN git clone --depth 1 https://github.com/vim/vim.git /tmp/vim \
		&& ( cd /tmp/vim && ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local \
		&& make install )

RUN ln -s $(which python3) /usr/bin/python; ln -s $(which pip3) /usr/bin/pip

RUN pip install \
    beautifulsoup4 \
    requests

RUN git clone https://github.com/ryanthomasjohnson/dotfiles.git /dotfiles \
    && (cd /dotfiles && ./install.sh)

RUN rm -rf tmp/*

