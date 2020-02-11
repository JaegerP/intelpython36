FROM continuumio/miniconda3

COPY environment.yml /src/environment.yml

WORKDIR /src
RUN conda env create --file environment.yml
RUN conda config --set auto_activate_base true

RUN echo "source /opt/conda/etc/profile.d/conda.sh"
RUN echo "conda activate intel" >> $HOME/.bashrc

CMD ["/bin/bash"]



