FROM arm64v8/alpine:20250108
LABEL authors="Fajrul Aulia"
LABEL email="fajrulaulia7@gmail.com"

ENV GOPATH="/root/go"
ENV GOBIN="$GOPATH/bin"
ENV PATH="$GOBIN:/usr/local/go/bin:$PATH"

WORKDIR /fw

COPY script.sh /fw/script.sh
RUN chmod +x /fw/script.sh

RUN apk add --no-cache curl wget make git unzip

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v30.2/protoc-30.2-linux-aarch_64.zip \
    && unzip protoc-30.2-linux-aarch_64.zip -d /usr/local \
    && rm protoc-30.2-linux-aarch_64.zip

RUN curl -LO https://golang.org/dl/go1.21.1.linux-arm64.tar.gz \
    && tar -C /usr/local -xzf go1.21.1.linux-arm64.tar.gz \
    && rm go1.21.1.linux-arm64.tar.gz


RUN mkdir -p /fw/generated


RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest



ENTRYPOINT ["/fw/script.sh"]