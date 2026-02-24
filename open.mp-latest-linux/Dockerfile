FROM debian:stable-slim

# Automatically provided build argument for the target architecture
ARG TARGETARCH

RUN mkdir -p /server
WORKDIR /server

# If we're building for AMD64, we need to install the 32-bit compatibility libraries
RUN if [ "$TARGETARCH" = "amd64" ]; then \
        dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y \
          libstdc++6:i386 \
          curl \
          wget \
          tar; \
    else \
        apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y \
          libstdc++6 \
          curl \
          wget \
          tar; \
    fi

# Download the latest open.mp server files
RUN curl -s https://api.github.com/repos/openmultiplayer/open.mp/releases/latest \
	# Find the download URL for the latest release
    | grep "browser_download_url.*open.mp-linux-x86.tar.gz" \
	# Extract the URL
    | cut -d : -f 2,3 \
	# Remove the quotes
    | tr -d \" \
	# Download the file
    | wget -qi - && \
	# Extract the file
    tar -xzf open.mp-linux-x86.tar.gz && \
	# Remove the archive
    rm open.mp-linux-x86.tar.gz && \
	# Move the server files to the root folder
	mv Server/* . && \
	# Remove the empty folder
	rmdir Server

# Copy required files to the container
COPY server/ /server/
COPY entrypoint.sh /entrypoint.sh

# Give execution rights on binaries
RUN chmod +x omp-server

# Expose the default port
EXPOSE 7777/udp

# Use the start script as entrypoint
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
