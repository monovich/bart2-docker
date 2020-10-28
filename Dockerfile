# Create docker container from base miniconda3 image
FROM continuumio/miniconda3

# Remove redundant bytecode cache files
ENV PYTHONDONTWRITEBYTECODE=true

# Create environment from yml (python 3.7.6)
ADD environment.yml environment.yml
RUN conda env create -f environment.yml
 
# Pull the environment name out of the environment.yml
RUN echo "source activate $(head -1 environment.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 environment.yml | cut -d' ' -f2)/bin:$PATH

# Clean up cached files, static libraries, javascript source maps, and unminified bokeh javascript
RUN conda clean -afy \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete

# BART initialization commands
ADD install-container.sh install-container.sh
RUN /bin/bash install-container.sh
