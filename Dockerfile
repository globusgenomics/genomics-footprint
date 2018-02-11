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

################## INSTALLATION OF BEDTOOLS ######################

RUN conda install bedtools=2.17.0

################## INSTALLATION OF SAMTOOLS ######################

RUN conda install samtools=1.1.0

################## INSTALLATION OF WELLINGTON ######################
RUN pip install pyDNase==0.2.5


################## INSTALLATION OF HINT ######################

RUN pip install cython numpy scipy
#RUN pip install RGT

################## INSTALLATION OF FSEQ ######################

USER root

RUN curl -o /tmp/fseq_1.84.tgz http://html-large-files-dept-fureylab.cloudapps.unc.edu/fureylabfiles/fseq/fseq_1.84.tgz

RUN cd /tmp

RUN tar -xzf /tmp/fseq_1.84.tgz -C /usr/bin/

ENV PATH="/usr/bin/fseq/bin:${PATH}"
##############################################################################
