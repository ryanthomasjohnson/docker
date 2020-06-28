FROM alpine:3.9.6

RUN apk add --no-cache \
        bash \
        build-base \
        ctags \
        curl \
        diffutils \
        entr \
        findutils \
        findutils-doc \
        g++ \
        git \
        git-doc \
        gtest \
        gtest-dev \
        lynx \
        make \
        man \
        man-pages \
        musl-dbg \
        ncurses-dev \
        newsboat \
        openrc \
        openssh \
        py3-pip \
        python3 \
        tmux \
        tmux-doc \
        tree \
        tree-doc \
        tzdata \
        vim \
        vim-doc

# RUN git clone --depth 1 https://github.com/vim/vim.git /tmp/vim \
#       && ( cd /tmp/vim && ./configure 
#             --with-features=huge \
#             --enable-multibyte \
#             --enable-python3interp=yes \
#             --with-python3-config-dir=$(python3-config --configdir) \
#             --disable-gui \
#             --disable-netbeans \
#       && make install )

RUN ln -s $(which python3) /usr/bin/python; ln -s $(which pip3) /usr/bin/pip

RUN pip install \
    beautifulsoup4 \
    requests

RUN echo -e '\n\
StrictModes no\n\
PasswordAuthentication no\n\
' >> /etc/ssh/sshd_config

RUN passwd -u root && sed -i 's/root:\/bin\/ash/root:\/bin\/bash/g' /etc/passwd

EXPOSE 20

CMD ssh-keygen -A; /usr/sbin/sshd -D

