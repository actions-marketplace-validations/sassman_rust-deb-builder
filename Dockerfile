ARG VERSION
FROM rust:${VERSION}-buster

LABEL name="rust-deb-builder"
LABEL version="$VERSION"
LABEL repository="https://github.com/sassman/rust-deb-builder"
LABEL homepage="https://github.com/sassman/rust-deb-builder"
LABEL maintainer="Sven Assmann"

RUN apt-get update && \
    apt-get install musl musl-dev musl-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    rustup target add x86_64-unknown-linux-musl && \
    cargo install cargo-deb

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]