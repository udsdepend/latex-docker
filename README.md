# UdS Depend LaTeX Docker Image

This branch contains the `Dockerfile` that builds the `latest` tag of the Docker image [`udsdepend/latex`](https://hub.docker.com/r/udsdepend/latex).
The image will always be based on `debian:testing` and will install the latest version of TeX Live available in the official Debian distribution (package [`texlive-full`](https://packages.debian.org/de/testing/tex/texlive-full)).

---

## Building/Updating the Image

To make use of Docker's build cache, first try to pull the image _with the desired tag_ that you want to build or update from Docker Hub.

```bash
sudo docker pull udsdepend/latex:latest || true
```

(The above step is not mandatory to build an image. If you don't want to pull the image, then remove the `--cache-from` arguments from the following commands.)

:a: If the repository is cloned to the local machine:

```bash
sudo docker build --pull --cache-from udsdepend/latex:latest --tag udsdepend/latex:latest .
```

:b: You can alternatively use the Git URL directly. Make sure to specify the desired branch/tag:

```bash
sudo docker build --pull --cache-from udsdepend/latex:latest --tag udsdepend/latex:latest "https://github.com/udsdepend/latex-docker.git#main"
```

## Verifying the TeX Live Installation:

Before pushing a new tag to Docker Hub, please make sure to follow these steps to verify the successful installation of TeX Live.

1.  Processing the LaTeX Sample Document:
    ```bash
    sudo docker run --rm -it udsdepend/latex:latest pdflatex sample2e
    ```
    Check the output log for warnings or errors. The final lines should look like:
    ```
    Output written on sample2e.pdf (3 pages, 142110 bytes).
    Transcript written on sample2e.log.
    ```
2.  Run the LaTeX Test Program:
    ```bash
    sudo docker run --rm -it udsdepend/latex:latest pdflatex ltxcheck
    ```
    Follow the on-screen instructions. Especially make sure that the output contains no error messages starting with `! BAD`.

## Pushing a New Tag to Docker Hub

```bash
# log in to Docker Hub
sudo docker login

# push the image
sudo docker push udsdepend/latex:latest

# remove the saved credentials
sudo docker logout
```
