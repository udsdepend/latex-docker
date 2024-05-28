#!/bin/bash
docker build --pull -t udsdepend/latex:latest .
docker run --rm --mount type=bind,src=./sample,target=/sample udsdepend/latex:latest latexmk -cd -C /sample/doc
docker run --rm --mount type=bind,src=./sample,target=/sample udsdepend/latex:latest latexmk -pdf -cd /sample/doc
