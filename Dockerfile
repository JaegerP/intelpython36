FROM continuumio/miniconda3

COPY environment.yml /src/environment.yml

WORKDIR /src
RUN apt-get update
RUN apt-get install -y gcc

RUN conda env create --file environment.yml
RUN conda config --set auto_activate_base true

RUN conda run -n intel pip install ray || true
RUN conda run -n intel python -c "import ray" || RUN conda run -n intel pip install ray

RUN echo "source /opt/conda/etc/profile.d/conda.sh"
RUN echo "conda activate intel" >> $HOME/.bashrc

CMD ["/bin/bash"]



