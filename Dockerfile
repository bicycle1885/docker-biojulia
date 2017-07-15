FROM julia:0.6

ENV CONDA_PATH /usr/local/conda

# Install Debian pakcages.
RUN apt-get update && apt-get install -y build-essential libxml2 libzmq3

# Install Miniconda3 (see https://repo.continuum.io/miniconda/).
RUN curl -o install.miniconda3.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash install.miniconda3.sh -b -p $CONDA_PATH && \
    rm install.miniconda3.sh

ENV PATH $CONDA_PATH/bin:$PATH

# Install Jupyter Notebook.
RUN conda install -y 'notebook=5' && conda clean -ya

# Install Julia packages.
ADD install.jl /tmp/install.jl

RUN julia /tmp/install.jl

# Expose port 8888 for Jupyter Notebook.
EXPOSE 8888

WORKDIR /workdir

ENTRYPOINT ["julia"]
