FROM ubuntu
FROM rust:latest
RUN rustup default nightly
RUN apt-get update
COPY . .
RUN mkdir -p /app
RUN cargo build
RUN cp ./ /app
RUN npm install -g browserify
RUN apt-get update && apt-get install ca-certificates libssl-dev && rm -rf /var/lib/apt/*
COPY . .
EXPOSE 7777
CMD ["/app"]
