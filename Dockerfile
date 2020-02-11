FROM continuumio/miniconda3

COPY environment.yml /src/environment.yml

WORKDIR /src
RUN conda env create --file environment.yml
RUN conda config --set core.default_env intel
RUN conda config --set auto_activate_base true

CMD ["/bin/bash"]



