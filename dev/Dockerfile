FROM ryanjohnson/ssh:latest

RUN apk add --no-cache \
    build-base \
    cmake \
    ctags \
    curl \
    diffutils \
    docker \
    entr \
    g++ \
    git \
    git-doc \
    gtest \
    gtest-dev \
    less-doc \
    lynx \
    make \
    musl-dbg \
    ncurses-dev \
    neovim \
    neovim-doc \
    newsboat \
    nodejs \
    openrc \
    py3-pip \
    python3 \
    yarn \
;

RUN rm -f /usr/bin/python /usr/bin/pip && \
    ln -s $(which python3) /usr/bin/python && \
    ln -s $(which pip3) /usr/bin/pip && \
:;

RUN pip install \
    beautifulsoup4 \
    requests \
;

# EECS 583
RUN apk add --no-cache \
    clang-dev=10.0.0-r2 \
    compiler-rt-static=10.0.0-r0 \
    compiler-rt=10.0.0-r0 \
    llvm10-dev=10.0.0-r2 \
    llvm10-static=10.0.0-r2 \
;

