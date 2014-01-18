# R installation 
FROM    ubuntu

# Variables
ENV     CRAN_MIRROR "http://cran.cnr.Berkeley.edu"

# Add cran mirror to package installer's sources list and update
CMD	["echo", "-e", "\n# R cran mirror"] >> /etc/apt/sources.list
RUN     echo "deb $CRAN_MIRROR/bin/linux/ubuntu precise/" >> /etc/apt/sources.list

# Add the signed key
RUN     gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
RUN     gpg -a --export E084DAB9 | apt-key add -

# Update & upgrade packages
RUN     apt-get update && apt-get upgrade

# Install R
RUN     apt-get install r-base -y
