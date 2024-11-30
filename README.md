# docker


conda activate dsci513
conda uninstall psycopg2
conda install psycopg2
conda install conda-forge::pgspecial

docker run --rm -it rocker/r-ver:4.3.2
conda install -c conda-forge conda-lock
docker
docker run --rm -it rocker/r-ver:4.3.2
docker run --rm -p 8787:8787 -e PASSWORD="asdf" rocker/rstudio:4.3.2
history
docker run --rm -p 8888:8888 jupyter/minimal-notebook:notebook-7.0.6
git status
git fetch origin
git checkout -b model_creation
git push origin model_creation
git branch

conda-lock -k explicit --file environment.yml -p linux-64
conda-lock -k explicit --file environment.yml -p linux-64 >> this did not solve figure out why

 docker build --tag testing_cmds .