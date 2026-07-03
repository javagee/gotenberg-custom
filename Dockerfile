FROM gotenberg/gotenberg:8

USER root

# Accept EULA for Microsoft fonts and install them
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ttf-mscorefonts-installer \
        fonts-liberation \
        fonts-noto \
        fonts-crosextra-carlito \
        fonts-crosextra-caladea \
        fonts-open-sans && \
    fc-cache -f -v && \
    rm -rf /var/lib/apt/lists/*

USER gotenberg
