# UdS Depend LaTeX Docker Image

## Building an Image

To make use of Docker's build cache, first try to pull the image _with the desired tag_ that you want to build or update from Docker Hub.

```bash
sudo docker pull udsdepend/latex:tag || true
```

(The above step is not mandatory to build an image. If you don't want to pull the image, then remove the `--cache-from` arguments from the following commands.)

:a: If the repository is cloned to the local machine:

```bash
# check out the desired branch (= tag)
git checkout <branch>

# build the image
sudo docker build --pull --cache-from udsdepend/latex:tag --tag udsdepend/latex:tag .
```

:b: You can alternatively use the Git URL directly. Make sure to specify the desired branch/tag:

```bash
sudo docker build --pull --cache-from udsdepend/latex:tag --tag udsdepend/latex:tag "https://github.com/udsdepend/latex-docker.git#tag"
```

## Verifying the TeX Live Installation:

Before pushing a new tag to Docker Hub, please make sure to follow these steps to verify the successful installation of TeX Live.

1.  Processing the LaTeX Sample Document:
    ```bash
    sudo docker run --rm -it udsdepend/latex:tag pdflatex sample2e
    ```
    Check the output log for warnings or errors. The final lines should look like:
    ```
    Output written on sample2e.pdf (3 pages, 142110 bytes).
    Transcript written on sample2e.log.
    ```
2.  Run the LaTeX Test Program:
    ```bash
    sudo docker run --rm -it udsdepend/latex:tag pdflatex ltxcheck
    ```
    Follow the on-screen instructions. Especially make sure that the output contains no error messages starting with `! BAD`.

## Pushing a New Tag to Docker Hub

```bash
# log in to Docker Hub
sudo docker login

# push the image
sudo docker push udsdepend/latex:tag

# remove the saved credentials
sudo docker logout
```
