Dockerfile for BioJulia
=======================

[docker-biojulia](https://github.com/bicycle1885/docker-biojulia)

This Dockerfile is based on Julia 0.6 and installs major packages listed below.

- BioAlignments.jl
- BioSequences.jl
- BioSymbols.jl
- GeneticVariation.jl
- GenomicFeatures.jl

This also installs [IJulia.jl](https://github.com/JuliaLang/IJulia.jl) and other
useful packages for bioinformatics.

To build a new docker image, install [Docker](<https://www.docker.com/>) and
then run `docker build -t biojulia .`.

Once the biojulia image is built, you can run `docker run -it --rm biojulia` to
start a Julia session:

    $ docker run -it --rm biojulia
                   _
       _       _ _(_)_     |  A fresh approach to technical computing
      (_)     | (_) (_)    |  Documentation: https://docs.julialang.org
       _ _   _| |_  __ _   |  Type "?help" for help.
      | | | | | | |/ _` |  |
      | | |_| | | | (_| |  |  Version 0.6.0 (2017-06-19 13:05 UTC)
     _/ |\__'_|_|_|\__'_|  |  Official http://julialang.org/ release
    |__/                   |  x86_64-pc-linux-gnu

    julia> using BioSequences

    julia> seq = dna"ACGTN"
    5nt DNA Sequence:
    ACGTN

To run your script in the current directory:

    $ docker run --rm -v $(pwd):/workdir biojulia myscript.jl

To start Jupyter Notebook:

    $ docker run --rm -p 8888:8888 --entrypoint jupyter biojulia notebook --ip=0.0.0.0 --allow-root
