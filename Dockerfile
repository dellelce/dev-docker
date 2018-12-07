# Semi-minimalist dev environment
FROM dellelce/py-base as base

LABEL maintainer="Antonio Dell'Elce"

ARG WORKDIR="/app/pyenv"

ENV PS1 "\\\$ "

# golang is a bit too big to go in the following list
RUN    apk add gcc bash wget perl perl-dev file xz make libc-dev linux-headers g++ sed \
           git nodejs \
    && mkdir ${WORKDIR} \
    && cd ${WORKDIR} \
    && ${INSTALLDIR}/bin/python3 -m venv . \
    && . bin/activate \
    && pip install -U pip setuptools \
    && echo "export PATH=${INSTALLDIR}/bin:$PATH" > $HOME/.bashrc \
    && echo ". ${WORKDIR}/bin/activate" >> $HOME/.bashrc

COPY vimrc /root/.vimrc

ENTRYPOINT /bin/bash

## That's All Folks ##
