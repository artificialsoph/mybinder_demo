FROM jupyter/tensorflow-notebook:27ba57364579
FROM jupyter/datascience-notebook:27ba57364579

RUN pip install --no-cache-dir vdom==0.5


RUN pip install numpy \
            matplotlib \
            ipywidgets \
            jupyter_contrib_nbextensions

RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter nbextension enable python-markdown/main
