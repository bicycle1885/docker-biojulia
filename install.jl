# Install BioJulia packages and other useful packages.

packages = [
    # BioJulia packages
    "BioAlignments",
    "BioSequences",
    "BioSymbols",
    "GeneticVariation",
    "GenomicFeatures",

    # Statistics
    "DataFrames",
    "Distances",
    "Distributions",
    "MultivariateStats",
    "StatsBase",
    "StatsFuns",
    "GLM",

    # Compression/decompression tools
    "CodecBzip2",
    "CodecXz",
    "CodecZlib",
    "CodecZstd",

    # Common file formats
    "CSV",
    "EzXML",
    "Feather",
    "JLD2",
    "JSON",
    "YAML",

    # Misc. useful packages
    "Combinatorics",
    "DocOpt",
    "Formatting",
    "Gadfly",
    "Images",
    "Interpolations",
    "IterTools",
    "SpecialFunctions",
]

Pkg.update()
for pkgname in packages
    # install
    Pkg.add(pkgname)
    # precompile
    eval(:(import $(Symbol(pkgname))))
end
