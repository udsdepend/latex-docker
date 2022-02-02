FROM debian:testing

RUN apt-get update && apt-get install -y \
  texlive-full \
  # for syntax highlighting with minted
  python3-pygments python-is-python3 \
  # for gnuplot backend of pgfplots
  gnuplot-nox && \
  # Removing documentation packages *after* installing them is kind of hacky,
  # but it only adds some overhead while building the image.
  apt-get --purge remove -y .\*-doc$ && \
  # Remove more unnecessary stuff
  apt-get clean -y
