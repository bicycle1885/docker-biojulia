# Initialize the package directory.
Pkg.init()

# Create REQUIRE file.
write(
Pkg.dir("REQUIRE"),
"""
# BioJulia packages
BioAlignments
BioSequences
BioSymbols
GeneticVariation
GenomicFeatures

# Statistics
DataFrames
Distances
Distributions
GLM
KernelDensity
MultivariateStats
StatsBase
StatsFuns

# Numerical analysis
DiffBase
ForwardDiff
Interpolations
Optim
ReverseDiff
SpecialFunctions

# Compression/decompression tools
CodecBzip2
CodecXz
CodecZlib
CodecZstd

# Common file formats
CSV
EzXML
Feather
JLD2
JSON
YAML

# Misc. useful packages
Combinatorics
DocOpt
Formatting
IJulia
Images
IterTools
""")

# Update METADATA.
Pkg.update()

# Install packages listed in REQUIRE.
Pkg.resolve()

# Precompile installed packages.
for pkgname in keys(Pkg.installed())
    eval(:(import $(Symbol(pkgname))))
end
