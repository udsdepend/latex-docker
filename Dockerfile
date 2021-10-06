FROM debian:bullseye

COPY texlive.profile /

# Install Dependencies
RUN apt-get update && apt-get install -y \
    fontconfig \
    gnupg2 \
    perl \
    wget

# Download and Install TeXLive
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar xzvf install-tl-unx.tar.gz \
    && ./install-tl-*/install-tl -profile texlive.profile \
    && tlmgr option repository ctan \
    && rm -rf install-tl-*

# Set up TeXLive Fonts for System-wide Use
RUN cp $(kpsexpand '$TEXMFSYSVAR')/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf \
    && fc-cache -fsv
