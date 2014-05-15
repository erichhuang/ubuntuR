# R installation 
FROM    ubuntu:14.04

# Variables
ENV     DEBIAN_FRONTEND noninteractive
ENV     CRAN_MIRROR http://watson.nci.nih.gov/cran_mirror/

# Add cran mirror to package installer's sources list and update
CMD	["echo", "-e", "\n# R cran mirror"] >> /etc/apt/sources.list
RUN     echo "deb $CRAN_MIRROR/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list

# Add the signed key
RUN     gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
RUN     gpg -a --export E084DAB9 | apt-key add -

# Update & upgrade packages
RUN     apt-get update && apt-get upgrade

# Install R
RUN     apt-get install r-base -y

# Specify the CRAN mirror for R to use
#   source: http://stackoverflow.com/a/8475208/1967630
RUN	touch ~/.Rprofile
CMD	["echo", "-e", "options(repos=structure(c(CRAN=\"$CRAN_MIRROR\")))"] >> ~/.Rprofile
