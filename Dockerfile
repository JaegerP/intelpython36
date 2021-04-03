FROM continuumio/miniconda3
ARG PYTHON_VERSION=3.6

RUN echo "Using python $PYTHON_VERSION ..."

COPY environment.yml /src/environment.yml

WORKDIR /src

RUN apt-get update
RUN apt-get install -y gcc

RUN conda create --yes -n intel -c intel python=$PYTHON_VERSION intelpython3_full
RUN conda env update -f environment.yml
RUN conda config --set auto_activate_base true

RUN conda run -n intel pip install ray || true
RUN conda run -n intel python -c "import ray" || RUN conda run -n intel pip install ray

RUN echo "source /opt/conda/etc/profile.d/conda.sh"
RUN echo "conda activate intel" >> $HOME/.bashrc

CMD ["/bin/bash"]



