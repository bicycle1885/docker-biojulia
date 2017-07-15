FROM julia:0.6

RUN apt-get update && apt-get install -y build-essential libxml2

ADD install.jl /tmp/install.jl

RUN julia /tmp/install.jl
