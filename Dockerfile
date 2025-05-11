# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
ARG BASE_CONTAINER=sagemath/sagemath:latest

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
# ARG BASE_CONTAINER=ucsdets/datascience-notebook:2021.2-stable

# scipy/machine learning (tensorflow, pytorch)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
# ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2021.3-42158c8

FROM $BASE_CONTAINER

#LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"
LABEL maintainer="wcheung@ucsd.edu"


#USER sage
#RUN sage -i jupyterlab jupyterlab_widgets retrolab

USER root
RUN chmod -R 0755 /home/sage

COPY --chown=root:bin artifacts/start-notebook.sh /usr/local/bin/start-notebook.sh 

