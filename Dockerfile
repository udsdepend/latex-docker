FROM debian:buster

RUN apt-get update && apt-get install -y \
  texlive-full \
  # for syntax highlighting with minted
  python3-pygments \
  # for gnuplot backend of pgfplots
  gnuplot-nox && \
  # Removing documentation packages *after* installing them is kind of hacky,
  # but it only adds some overhead while building the image.
  apt-get --purge remove -y .\*-doc$ && \
  # Remove more unnecessary stuff
  apt-get clean -y && \
  # bad fix for making python3 the default
  ln -s /usr/bin/python3 /usr/bin/python
