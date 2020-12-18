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
    xauth \
    xclip \
    xclip-doc \
;

RUN sed -i 's/.*PermitRootLogin.*/PermitRootLogin no/g' \
        /etc/ssh/sshd_config && \
    sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication no/g' \
        /etc/ssh/sshd_config && \
    sed -i 's/.*X11Forwarding.*/X11Forwarding yes/g' \
        /etc/ssh/sshd_config && \
    sed -i 's/.*X11UseLocalhost.*/X11UseLocalhost no/g' \
        /etc/ssh/sshd_config && \
    sed -i 's/# %sudo\tALL=(ALL) ALL/%sudo ALL=(ALL) ALL/g' \
        /etc/sudoers && \
:;

COPY entrypoint.sh /

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]

