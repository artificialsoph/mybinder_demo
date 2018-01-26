FROM jupyter/tensorflow-notebook:27ba57364579

RUN pip install -U \
    numpy \
    matplotlib \
    ipywidgets \
    jupyter_contrib_nbextensions \
    yapf \
    autopep8
            

RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter nbextension enable python-markdown/main

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
