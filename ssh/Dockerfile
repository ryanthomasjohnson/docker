FROM alpine:latest

RUN apk add --no-cache \
    bash \
    findutils \
    findutils-doc \
    man-pages \
    mandoc \
    openssh \
    sudo \
    tmux \
    tmux-doc \
    tree \
    tree-doc \
    tzdata \
    vim \
    vim-doc \
;

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' \
        /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' \
        /etc/ssh/sshd_config && \
    sed -i 's/# %sudo\tALL=(ALL) ALL/%sudo ALL=(ALL) ALL/g' \
        /etc/sudoers && \
:;

COPY entrypoint.sh /

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]

