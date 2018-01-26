FROM jupyter/tensorflow-notebook:27ba57364579

RUN conda install --quiet --yes \
    numpy \
    matplotlib \
    ipywidgets \
    jupyter_contrib_nbextensions \
    vdom \
    yapf \
    autopep8 \
    conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR
            

RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter nbextension enable python-markdown/main

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
