FROM alpine:latest

RUN apk add --no-cache \
        bash \
        build-base \
        cmake \
        ctags \
        curl \
        diffutils \
        docker \
        entr \
        findutils \
        findutils-doc \
        g++ \
        git \
        git-doc \
        gtest \
        gtest-dev \
        less-doc \
        lynx \
        make \
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

RUN rm -f /usr/bin/python /usr/bin/pip && \
    ln -s $(which python3) /usr/bin/python && \
    ln -s $(which pip3) /usr/bin/pip

RUN pip install \
    beautifulsoup4 \
    requests

RUN echo -e '\n\
StrictModes no\n\
PasswordAuthentication no\n\
' >> /etc/ssh/sshd_config

RUN passwd -u root && sed -i 's/root:\/bin\/ash/root:\/bin\/bash/g' /etc/passwd

EXPOSE 22

CMD ssh-keygen -A; /usr/sbin/sshd -D

