# Gengoc

**Gengoc** is a lightweight, Docker-based Protocol Buffers (protobuf) and gRPC code generator designed for **ARM64 environments**. It simplifies generating Go code from `.proto` files without requiring complex local setup.

---

## ✨ Features

* 🧩 Generate Go protobuf & gRPC code
* ⚡ Optimized for ARM64 architecture
* 🐳 Fully Dockerized (no local dependency needed)
* 🪶 Lightweight (Alpine-based image)
* 📦 Easy integration into CI/CD pipelines

---

## 🚀 Quick Start

Run the container with mounted directories:

```bash
docker run --rm --name gengoc \
  -v "./example/:/fw/proto/" \
  -v "./generated:/fw/generated" \
  faaawidia/gengoc-alpine-arm64:latest
```

---

## 📂 How It Works

Gengoc uses pre-installed tools inside the container:

* `protoc`
* `protoc-gen-go`
* `protoc-gen-go-grpc`

### Directory Mapping

| Local Path     | Container Path  | Description               |
| -------------- | --------------- | ------------------------- |
| `./example/`   | `/fw/proto/`    | Input `.proto` files      |
| `./generated/` | `/fw/generated` | Generated Go files output |

---

## 📦 Output Example

After running, you will get:

```
generated/
├── hello.pb.go
├── hello_grpc.pb.go
```

---

## 🧪 Example Project Structure

```
.
├── core/
│   ├── proto/               # Proto files
│   ├── adapter/
│   │   ├── grpc/            # Generated output
├── Dockerfile
├── Makefile
└── README.md
```

### Run with Custom Structure

```bash
docker run --rm --name gengoc \
  -v "./core/proto/:/fw/proto/" \
  -v "./core/adapter/grpc/:/fw/generated" \
  faaawidia/gengoc-alpine-arm64:latest
```

---

## ⚠️ Troubleshooting

### Permission Issues

If you encounter permission errors:

```bash
sudo docker run ...
```

or fix folder permissions:

```bash
chmod -R 777 generated/
```

### No Output Generated

* Ensure `.proto` files exist in the mounted directory
* Verify mount paths are correct

---

## 💡 Why Gengoc?

* No need to install protobuf or plugins locally
* Works out-of-the-box on ARM64 machines
* Minimal setup for fast development
* Ideal for containerized workflows

---

## 🔧 Roadmap (Future Improvements)

* [ ] Support custom output paths via arguments/env
* [ ] Multi-architecture support (amd64 + arm64)
* [ ] CLI wrapper (without raw docker command)
* [ ] Plugin support (grpc-gateway, OpenAPI)
* [ ] Version tagging & release management

---

## 📄 License

This project is licensed under the MIT License.

---

## 🤝 Contributions

Contributions are welcome! Feel free to:

* Open issues
* Submit pull requests
* Suggest improvements

---

## 🔗 Contact

* Telegram: https://t.me/fajrulaulia

---

## ⭐ Support

If you find this useful, consider giving it a star ⭐
