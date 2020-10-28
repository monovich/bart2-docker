FROM continuumio/miniconda3 as stepone
ENV PYTHONDONTWRITEBYTECODE=true
COPY environment.yml /home/BARTv2.0/environment.yml
WORKDIR /home
WORKDIR BARTv2.0
RUN conda env create -f /home/BARTv2.0/environment.yml

#FROM continuumio/miniconda3 as steptwo
#COPY --from=stepone / /
RUN echo "source activate $(head -1 /home/BARTv2.0/environment.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PYTHONDONTWRITEBYTECODE=true
ENV PATH /opt/conda/envs/$(head -1 /home/BARTv2.0/environment.yml | cut -d' ' -f2)/bin:$PATH
 
#FROM continuumio/miniconda3 as stepthree
#COPY --from=steptwo / /
RUN conda clean -afy

#FROM continuumio/miniconda3 as stepfour
#COPY --from=stepthree / /
COPY /bin/bart_v2.0 /home/BARTv2.0/bin/bart_v2.0
WORKDIR /home/BARTv2.0/bin/bart_v2.0
RUN python setup.py install
ENV PATH /home/BARTv2.0/bin/bart_v2.0/bin/:$PATH

# NOT IMPLEMENTED AT THE MOMENT: (Size reducers)
#    && find /opt/conda/ -follow -type f -name '*.a' -delete \
#    && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
#    && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
#    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -follow -type f -name '*.js' ! -name '*.min.js' -delete


