# Build the assembly
sudo docker build -t lns .

# Run the created image to copy the built assembly to the host
rm -rf docker-build-out || true
mkdir -p docker-build-out
sudo docker run --rm -v ./docker-build-out:/docker-build-out -it lns cp /app/lns /docker-build-out