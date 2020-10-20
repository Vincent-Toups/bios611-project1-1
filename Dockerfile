FROM rocker/verse
MAINTAINER Arti Virkud <virkud@mit.edu>
ARG linux_user_pwd
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('data.table')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('caret')"
RUN R -e "install.packages('e1071')"
RUN R -e "install.packages('gridExtra')"
RUN R -e "install.packages('reshape')"
RUN R -e "install.packages('plyr')"
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo "rstudio:$linux_user_pwd" | chpasswd
RUN adduser rstudio sudo
RUN apt update -y && apt install -y\
        ne\
        sqlite3\
        texlive-latex-base\
        texlive-latex-extra