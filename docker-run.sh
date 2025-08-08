sudo docker run --rm -it \
    --privileged \
    -v "$(pwd)/output:/build" \
    -v "$(pwd)/config/package-lists/:/build/config/package-lists/" \
    -v "$(pwd)/config/hooks:/build/config/hooks" \
    -v "$(pwd)/auto:/build/auto" \
    debian-live-auto
