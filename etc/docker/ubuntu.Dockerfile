FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl git less gcc

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN git clone https://github.com/dandavison/prism.git
WORKDIR prism
RUN /root/.cargo/bin/cargo build --release

ENV PATH="${PWD}/target/release:${PATH}"

CMD prism
