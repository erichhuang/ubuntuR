# OFP API Setup
FROM    ubuntu

# Variables
ENV     CRAN_MIRROR "http://cran.cnr.Berkeley.edu"

# Add cran mirror to package installer's sources list and update
RUN     echo -e "\n# R cran mirror" >> /etc/apt/sources.list
RUN     echo -e "deb $CRAN_MIRROR/bin/linux/ubuntu precise/" >> /etc/apt/sources.list

# Add the signed key
RUN     apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN     gpg -a --export E084DAB9 | apt-key add -

# Update & upgrade packages
RUN     apt-get update && apt-get upgrade

# Install R
RUN     apt-get install r-base
