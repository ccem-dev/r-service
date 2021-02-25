FROM rocker/r-ver:3.5.0

RUN apt-get update -qq && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev

RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('devtools',dependencies=TRUE, repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('rjson',dependencies=TRUE, repos = 'http://cran.us.r-project.org')"

COPY plumber.R /
COPY main.R /

ENTRYPOINT ["Rscript", "main.R"]