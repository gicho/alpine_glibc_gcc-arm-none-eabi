FROM frolvlad/alpine-glibc:alpine-3.8_glibc-2.28

# -- Build Tools
# Install Needed package for toolchain download: ca-certificates, openssl, wget
# Download the toolchain
# Uncompress it
# Remove upper package and toolchain archive
# Remove toolchain doc
RUN ALPINE_ARM_NONE_EABI_BASE_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm" && \
    ALPINE_ARM_NONE_EABI_PACKAGE_DATE="7-2018q2" && \
    ALPINE_ARM_NONE_EABI_PACKAGE_VERSION="7-2018-q2-update" && \
    ALPINE_ARM_NONE_EABI_PACKAGE_NAME="gcc-arm-none-eabi-$ALPINE_ARM_NONE_EABI_PACKAGE_VERSION" && \
    ALPINE_ARM_NONE_EABI_PACKAGE_FILENAME="$ALPINE_ARM_NONE_EABI_PACKAGE_NAME-linux.tar.bz2" && \
    apk add --no-cache --virtual build-dependencies \
        ca-certificates \
        openssl \
        wget && \
    wget "$ALPINE_ARM_NONE_EABI_BASE_URL/$ALPINE_ARM_NONE_EABI_PACKAGE_DATE/$ALPINE_ARM_NONE_EABI_PACKAGE_FILENAME" && \
    mkdir /toolchain && \
    tar xvf "$ALPINE_ARM_NONE_EABI_PACKAGE_FILENAME" -C /toolchain && \
    rm "$ALPINE_ARM_NONE_EABI_PACKAGE_FILENAME" && \
    apk del build-dependencies && \
    rm -rf "/toolchain/$ALPINE_ARM_NONE_EABI_PACKAGE_NAME/share/doc" && \
    apk add --no-cache make=4.2.1-r2

# Set up the compiler path
ENV PATH="/toolchain/$ALPINE_ARM_NONE_EABI_PACKAGE_NAME/bin:${PATH}"

WORKDIR /home

