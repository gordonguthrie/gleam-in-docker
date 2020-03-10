FROM elixir:1.9.4

USER root

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y make
RUN apt-get install -y unzip
RUN apt-get install -y lynx
RUN apt-get install -y emacs
RUN apt-get install -y wget
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y postgresql postgresql-contrib
RUN apt-get install -y sudo
RUN apt-get install -y x11-apps
RUN apt-get install -y less

# Replace 1000 with your user / group id
RUN export uid=501 gid=20 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer && \
    mkdir /home/developer/.mix && \
    chown ${uid}:${gid} -R /home/developer/.mix && \
	mix local.hex --force && \
	mix archive.install hex phx_new 1.4.12 --force

USER developer

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
  | sh -s -- --default-toolchain stable -y && \
    /home/developer/.cargo/bin/rustup update beta && \
    /home/developer/.cargo/bin/rustup update nightly

RUN cd /tmp && \
    git clone https://github.com/gleam-lang/gleam.git --branch v0.5.0 && \
    cd gleam && \
    PATH=/home/developer/.cargo/bin:$PATH make install
RUN PATH=/home/developer/.cargo/bin:$PATH gleam --version

RUN PATH=/home/developer/.cargo/bin:$PATH cargo install mdbook

ENV PATH=/home/developer/.cargo/bin:$PATH

#CMD ["/bin/bash"]
CMD tail -f /dev/null
