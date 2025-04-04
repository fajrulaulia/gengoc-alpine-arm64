#!/bin/sh

echo "📂 Checking proto and output directories..."
ls -lah /fw/proto

PROTO_FILES=$(find /fw/proto -type f -name "*.proto")

if [ -z "$PROTO_FILES" ]; then
    echo "❌ No .proto files found in /fw/proto"
    exit 1
fi

for FILE in $PROTO_FILES; do
    BASENAME=$(basename "$FILE" .proto)  # Ambil nama file tanpa ekstensi
    OUTPUT_DIR="/fw/generated/$BASENAME" # Buat folder berdasarkan nama file
    mkdir -p "$OUTPUT_DIR"

    echo "🔄 Processing $FILE..."
    echo "📂 Creating output directory: $OUTPUT_DIR"
    protoc --proto_path=/fw/proto --go_out="$OUTPUT_DIR" --go-grpc_out="$OUTPUT_DIR" "$FILE"
    echo "✅ Generated files for $BASENAME in $OUTPUT_DIR"
done

echo "📂 Listing generated files:"
ls -lah /fw/generated/*
