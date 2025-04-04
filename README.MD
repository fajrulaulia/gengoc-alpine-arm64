# Gengoc

Gengoc is a lightweight Protocol Buffers (protobuf) compiler and gRPC generator designed specifically for ARM architecture. It simplifies the process of generating Go code from .proto files.

## Features

- Supports ARM architecture
- Generates Go protobuf and gRPC code
- Lightweight Alpine-based container
- Easily mount your .proto files for code generation

## How to Run

```shell
docker run --rm --name gengoc \
         -v "./example/:/fw/proto/" \
         -v "./generated:/fw/generated" \
           faaawidia/gengoc-alpine-arm64:latest
```

Command Breakdown:
- --rm → Removes the container after execution.
- --name gengoc → Names the container gengoc.
- -v "./example/:/fw/proto/" → Mounts your local example/ folder (containing .proto files) into the container.
- -v "./generated:/fw/generated" → Mounts the generated/ folder to store the generated Go files.
- faaawidia/gengoc-alpine-arm64:latest → Uses the latest ARM-based Gengoc image.

## Example

Given:
here project with directory:
```bash
.
├── core/
│   ├── proto/               # Proto files (e.g., blog.proto)
│   ├── adapter/
│   │   ├── grpc/            # here we will make output generated
├── Dockerfile
├── Makefile
└── README.md

```

just run
```bash
docker run --rm --name gengoc \
         -v "./core/proto/:/fw/proto/" \
         -v "./core/adapter/grpc/:/fw/generated" \
           faaawidia/gengoc-alpine-arm64:latest

```
## License

This project is licensed under the MIT License.


## Contributions

Feel free to contribute by submitting issues or pull requests.

🔗 Connect with Me

📧 Telegram: t.me/fajrulaulia