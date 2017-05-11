#!/bin/bash
# Note that on the teaching server this is using tcsh
# Scripts for the OMBI metagenomics workshop
#start qiime
activate_qiime  # use deactivate_qiime to deactivate
# Functions can be found at http://qiime.org/scripts/
beta_diversity_through_plots.py -h
beta_diversity_through_plots.py -i input/otu_table.biom -o results/bdiv -m input/map.txt -t input/tree.newick -f
# note the -e setting (set the depth of coverage for even sampling)
# to specify a different kind of distance metric, -p specifies a parameter file (so you can
# adjust the underlying distance metric in the sub-scripts in this workflow)

# Statistical
compare_categories.py -i results/bdiv/weighted_unifrac_dm.txt --method adonis -m input/map.txt -o adonis_results -c growth_rate,complex_robust,host_genus_id,functional_group_sensu_darling
