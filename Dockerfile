################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL software="TFBS Software"
LABEL software.version="0.1"
LABEL description="Software required to generate DNase footprints"
LABEL tags="Footprints"

################## MAINTAINER ######################
MAINTAINER Ravi K. Madduri <madduri@anl.gov>

################## UPDATE OF SYSTEM PACKAGES ######################

USER root

RUN apt-get update && apt-get install -y git build-essential zlib1g-dev libpng-dev libcurl4-openssl-dev
################## INSTALLATION OF HINT ######################
RUN conda install pybigwig -c bioconda
RUN pip install ngslib
RUN pip install RGT

################## INSTALLATION OF BEDTOOLS ######################

RUN conda install bedtools=2.17.0

################## INSTALLATION OF SAMTOOLS ######################

RUN conda install samtools=1.1.0

################## INSTALLATION OF WELLINGTON ######################
RUN pip install pyDNase==0.2.5

################## INSTALLATION OF FSEQ ######################

RUN curl -o /tmp/fseq_1.84.tgz http://html-large-files-dept-fureylab.cloudapps.unc.edu/fureylabfiles/fseq/fseq_1.84.tgz

RUN cd /tmp

RUN tar -xzf /tmp/fseq_1.84.tgz -C /usr/bin/

ENV PATH="/usr/bin/fseq/bin:${PATH}"

################## INSTALLATION OF SNAP from Github version ######################

WORKDIR /tmp/
RUN git clone https://github.com/amplab/snap.git
WORKDIR /tmp/snap
RUN git checkout 48e7ae5d38145c094af1fe42a4b3abf1e72e1bb7
WORKDIR /tmp/snap/
RUN make
RUN mv /tmp/snap/snap-aligner /usr/bin/
RUN rm -rf /tmp/snap
##############################################################################
