FROM julia:0.6

RUN    julia -e 'Pkg.update()' \
    && julia -e 'Pkg.add("BioAlignments"); import BioAlignments' \
    && julia -e 'Pkg.add("BioSequences"); import BioSequences' \
    && julia -e 'Pkg.add("BioSymbols"); import BioSymbols' \
    && julia -e 'Pkg.add("GeneticVariation"); import GeneticVariation' \
    && julia -e 'Pkg.add("GenomicFeatures"); import GenomicFeatures'
