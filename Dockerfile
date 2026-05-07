FROM kalilinux/kali-rolling

# Update and install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3 \
    python3-pip \
    git \
    curl \
    dnsrecon \
    enum4linux \
    feroxbuster \
    gobuster \
    impacket-scripts \
    nbtscan \
    nikto \
    nmap \
    onesixtyone \
    oscanner \
    redis-tools \
    seclists \
    smbclient \
    smbmap \
    snmp \
    sslscan \
    sipvicious \
    tnscmd10g \
    whatweb \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install AutoRecon
RUN python3 -m pip install --no-cache-dir --break-system-packages .

# Entry point for AutoRecon
ENTRYPOINT ["autorecon"]
