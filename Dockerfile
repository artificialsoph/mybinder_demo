FROM jupyter/tensorflow-notebook:latest
FROM jupyter/datascience-notebook:latest
FROM jupyter/all-spark-notebook:latest

RUN pip install --no-cache-dir vdom==0.5


RUN pip install numpy \
            matplotlib \
            ipywidgets \
            jupyter_contrib_nbextensions

RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter nbextension enable python-markdown/main

# Notebooks w/ extensions that auto-run code must be "trusted" to work the first time
RUN jupyter trust ./**.ipynb
