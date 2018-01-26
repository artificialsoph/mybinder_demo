FROM jupyter/tensorflow-notebook:latest
FROM jupyter/datascience-notebook:latest
FROM jupyter/all-spark-notebook:latest

RUN pip install --no-cache-dir vdom==0.5
