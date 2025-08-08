sudo docker run --rm -it \
    --privileged \
    -v "$(pwd)/output:/build/output" \
    -v "$(pwd)/config/package-lists/*:/build 
    -v "$(pwd)/auto:/build/auto" \
    debian-live-auto
