# Install R
sudo apt update
sudo apt install gdebi-core nginx libxml2-dev libssl-dev libcurl4-openssl-dev libcurl4-gnutls-dev libopenblas-dev libcairo2-dev libxt-dev r-base r-base-dev

# Install RStudio
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1093-amd64.deb
sudo gdebi rstudio-server-1.3.1093-amd64.deb

# Install common packages
R --vanilla << EOF
install.packages(c("tidyverse","data.table","dtplyr","devtools","roxygen2","bit64","readr"), repos = "https://cran.rstudio.com/")
q()
EOF

# Install TDD packages
R --vanilla << EOF
install.packages("testthis",repos = "https://cran.rstudio.com/")
q()
EOF

# Export to HTML/Excel
R --vanilla << EOF
install.packages(c("htmlTable","openxlsx"), repos = "https://cran.rstudio.com/")
q()
EOF

# Blog tools
R --vanilla << EOF
install.packages(c("knitr","rmarkdown"), repos='http://cran.us.r-project.org')
q()
EOF
sudo apt install python-pip
sudo apt install python3-pip
sudo -H pip install markdown rpy2==2.7.1 pelican==3.7.1
sudo -H pip3 install markdown rpy2==2.9.3 pelican==3.7.1 

# PDF extraction tools
sudo apt install libpoppler-cpp-dev default-jre default-jdk r-cran-rjava
sudo R CMD javareconf
R --vanilla << EOF
library(devtools)
install.packages("pdftools", repos = "https://cran.rstudio.com/")
install_github("ropensci/tabulizer")
q()
EOF

# TTF/OTF fonts usage
sudo apt install libfreetype6-dev
R --vanilla << EOF
install.packages("showtext", repos = "https://cran.rstudio.com/")
q()
EOF

# Cairo for graphic devices
sudo apt install libgtk2.0-dev libxt-dev libcairo2-dev
R --vanilla << EOF
install.packages("Cairo", repos = "https://cran.rstudio.com/")
q()
EOF

# Texlive for Latex/knitr
sudo apt -y install texlive
sudo apt -y install texlive-latex-recommended texlive-pictures texlive-latex-extra


# Apache DRILL

sudo apt-get install openjdk-8-jdk
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

cd /usr/local
sudo wget http://apache.mirrors.hoobly.com/drill/drill-1.17.0/apache-drill-1.17.0.tar.gz
sudo tar -xvzf apache-drill-1.17.0.tar.gz
## Navigate to the Drill installation directory. For example:
# cd apache-drill-<version>
## Issue the following command to launch Drill in embedded mode:
# bin/drill-embedded

## instalamos arow para formato parquet y compresión.
R --vanilla << EOF
install.packages("arrow", repos = "https://cran.rstudio.com/")
q()
EOF


## instalamos sergeant para comunicarnos con Apache Drill
R --vanilla << EOF
install.packages("sergeant", repos = "https://cinc.rud.is")
q()
EOF


