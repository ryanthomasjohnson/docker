FROM archlinux:latest

RUN sed -i '/NoExtract.*usr\/share\/man.*/d' /etc/pacman.conf

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm \
    man-db \
    man-pages \
    openssh \
    sudo \
    tmux \
    tree \
    vi \
    vim \
    which \
    xclip \
    xorg-xauth \
;

RUN pacman -Sc --noconfirm

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
