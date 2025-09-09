[![GloBI Review by Elton](../../actions/workflows/review.yml/badge.svg)](../../actions/workflows/review.yml) [![GloBI](https://api.globalbioticinteractions.org/interaction.svg?accordingTo=globi:globalbioticinteractions/globalfungi&refutes=true&refutes=false)](https://globalbioticinteractions.org/?accordingTo=globi:globalbioticinteractions/globalfungi)

Configuration to help Global Biotic Interactions (GloBI, https://globalbioticinteractions.org) index: 

Větrovský, T., Morais, D., Kohout, P., Lepinay, C., Algora, C., Awokunle Hollá, S., Bahnmann, B.D., Bílohnědá, K., Brabcová, V., D’Alò, F., Human, Z.R., Jomura, M., Kolařík, M., Kvasničková, J., Lladó, S., López-Mondéjar, R., Martinović, T., Mašínová, T., Meszárošová, L., Michalčíková, L., Michalová, T., Mundra, S., Navrátilová, D., Odriozola, I., Piché-Choquette, S., Štursová, M., Švec, K., Tláskal, V., Urbanová, M., Vlk, L., Voříšková, J., Žifčáková, L., Baldrian, P., 2020. GlobalFungi, a global database of fungal occurrences from high-throughput-sequencing metabarcoding studies. Scientific Data 7, 228. https://doi.org/10.1038/s41597-020-0567-7

## Methods 

In order to facilitate indexing of plant-fungi associations, Global Fungi v5 data files were manually downloaded from https://globalfungi.com on 2025-09-04 and copies were deposited independently here. The reason for making this copy is that https://globalfungi.com did not provide a method to automatically access the resources: tor some reason, the Global Fungi website supports only manual downloads at time of writing. 

In addition, the provided tables were rotated from the wide format (with >20k columns) to a long format using the bash program [```wide2long.sh```](./wide2long.sh) to help facilitate reuse: users reported issues with loading tab-separated tables like ```GlobalFungi_5_species_abundance_ITS1.txt.gz``` into R or excel due to the large amount of columns. The rotated version of associated tables can be found using by replacing the extension ```.txt.gz``` with ```.long.txt.gz```. E.g., ```GlobalFungi_5_species_abundance_ITS1.txt.gz``` has a rotated version the in the file called ```GlobalFungi_5_species_abundance_ITS1.long.txt.gz```.

The original table has shape:

| sample_ID | Apiospora esporlensis | Spizellomyces punctatus | ... | Penicillium sublateritium | Atla wheldonii | all_other_fungal_sequences |
| --- | --- | --- | --- | --- | --- | --- |
| GF05000787S | 0 | 0 | ... | 0 | 0 | 1752 |
| GF04002266S | 0 | 0 | ... | 0 | 0 | 95044 |
| ... | ... | ... | ... | ... | ... | ... |
| GF02003794S | 0 | 0 | ... | 0 | 0 | 17 |
| GF04002823S | 0 | 0 | ... | 0 | 0 | 439 |

with 19181 columns, whereas the rotated tables have the following structure:

| sample_ID | item | value |
| --- | --- | --- |
| GF05000787S | Leotiomycetes sp. | 1 |
| GF05000787S | Cortinarius vernus | 20 |
| ... | ... | ... |
| GF02003794S | all_other_fungal_sequences | 17 |
| GF04002823S | all_other_fungal_sequences | 439 |

Note that all sample_ID species combinations with "0" have been excluded in this rotated table.

To help better understand the included Global Fungi resources, a copy of the "download" page of https://globalfungi.com is transcribed below from a 2025-09-09 version:

### Download of GlobalFungi taxon observation data
The data on sequence abundances of fungal taxa in samples of the GlobalFungi Database, Release 5 , and the corresponding sample metadata table are available for download here:

#### Genus-level abundance tables:
[```GlobalFungi_5_genus_abundance_ITS1.txt.gz```](GlobalFungi_5_genus_abundance_ITS1.txt.gz) - Compressed table containing sequences assigned to fungal genera and samples based on the ITS1 sequence (ed. long version at [```GlobalFungi_5_genus_abundance_ITS1.long.txt.gz```](GlobalFungi_5_genus_abundance_ITS1.longtxt.gz)).

[```GlobalFungi_5_genus_abundance_ITS2.txt.gz```](GlobalFungi_5_genus_abundance_ITS2.txt.gz) - Compressed table containing sequences assigned to fungal genera and samples based on the ITS2 sequence. (ed. long version at [```GlobalFungi_5_genus_abundance_ITS2.long.txt.gz```](GlobalFungi_5_genus_abundance_ITS2.long.txt.gz)).

[```GlobalFungi_5_genus_abundance_ITS1_ITS2.txt.gz```](GlobalFungi_5_genus_abundance_ITS1_ITS2.txt.gz) - Compressed table containing sequences assigned to fungal genera and samples based on the ITS1 + ITS2 sequences (ed. long version available at [```GlobalFungi_5_genus_abundance_ITS1_ITS2.long.txt.gz```](GlobalFungi_5_genus_abundance_ITS1_ITS2.long.txt.gz)).

### Species-level abundance tables:
[```GlobalFungi_5_species_abundance_ITS1.txt.gz```](GlobalFungi_5_species_abundance_ITS1.txt.gz) - Compressed table containing sequences assigned to fungal species and samples based on the ITS1 sequence (ed. long version at [```GlobalFungi_5_species_abundance_ITS1.long.txt.gz```](GlobalFungi_5_species_abundance_ITS1.long.txt.gz)).

[```GlobalFungi_5_species_abundance_ITS2.txt.gz```](GlobalFungi_5_species_abundance_ITS2.txt.gz) - Compressed table containing sequences assigned to fungal species and samples based on the ITS2 sequence (ed. long version at [```GlobalFungi_5_species_abundance_ITS2.long.txt.gz```](GlobalFungi_5_species_abundance_ITS2.long.txt.gz)).

[```GlobalFungi_5_species_abundance_ITS1_ITS2.txt.gz```](GlobalFungi_5_species_abundance_ITS1_ITS2.txt.gz) - Compressed table containing sequences assigned to fungal species and samples based on the ITS1 + ITS2 sequences (ed. long version at [```GlobalFungi_5_species_abundance_ITS1_ITS2.long.txt.gz```](GlobalFungi_5_species_abundance_ITS1_ITS2.long.txt.gz))

#### Species hypothesis (SH) abundance tables (UNITE 10.0 dynamic species hypotheses):
[```GlobalFungi_5_SH_abundance_ITS1.txt.gz```](GlobalFungi_5_SH_abundance_ITS1.txt.gz) - Compressed table containing sequences assigned to fungal UNITE 10.0 dynamic species hypotheses and samples based on the ITS1 sequence (ed. long version at [```GlobalFungi_5_SH_abundance_ITS1.long.txt.gz```](GlobalFungi_5_SH_abundance_ITS1.long.txt.gz)).

[```GlobalFungi_5_SH_abundance_ITS2.txt.gz```](GlobalFungi_5_SH_abundance_ITS2.txt.gz) - Compressed table containing sequences assigned to fungal UNITE 10.0 dynamic species hypotheses and samples based on the ITS2 sequence (ed. long version at [```GlobalFungi_5_SH_abundance_ITS1.long.txt.gz```](GlobalFungi_5_SH_abundance_ITS1.long.txt.gz)).

[```GlobalFungi_5_SH_abundance_ITS1_ITS2.txt.gz```](GlobalFungi_5_SH_abundance_ITS1_ITS2.txt.gz) - Compressed table containing sequences assigned to fungal UNITE 10.0 dynamic species hypotheses and samples based on the ITS1 + ITS2 sequences (ed. long version at [```GlobalFungi_5_SH_abundance_ITS1_ITS2.long.txt.gz```](GlobalFungi_5_SH_abundance_ITS1_ITS2.long.txt.gz)).

#### Metadata and documentation:
[```GlobalFungi_5_sample_metadata.txt.gz```](GlobalFungi_5_sample_metadata.txt.gz) - Table containing sample metadata (columns) of samples (rows)

[```Metadata_table_description.pdf```](Metadata_table_description.pdf) - Table containing description of sample metadata fields

#### Citation Guidelines

If using the downloaded data or any part of it in your publication, please cite:

Větrovský, T., Morais, D., Kohout, P., Lepinay, C., Algora, C., Awokunle Hollá, S., Bahnmann, B.D., Bílohnědá, K., Brabcová, V., D’Alò, F., Human, Z.R., Jomura, M., Kolařík, M., Kvasničková, J., Lladó, S., López-Mondéjar, R., Martinović, T., Mašínová, T., Meszárošová, L., Michalčíková, L., Michalová, T., Mundra, S., Navrátilová, D., Odriozola, I., Piché-Choquette, S., Štursová, M., Švec, K., Tláskal, V., Urbanová, M., Vlk, L., Voříšková, J., Žifčáková, L., Baldrian, P., 2020. GlobalFungi, a global database of fungal occurrences from high-throughput-sequencing metabarcoding studies. Scientific Data 7, 228.
[https://doi.org/10.1038/s41597-020-0567-7](https://doi.org/10.1038/s41597-020-0567-7).

#### General Rules of Sequence Processing and Construction of Fungal Taxon / Sample Tables

Raw public sequencing datasets were processed as follows:

    All raw sequences with the mean quality Phred scores ≥ 20 were retained; others were discarded.
    Full ITS1 or ITS2 fungal region was extracted using Perl script ITSx v1.0.11 (Bengtsson-Palme et al., 2013) from each retained raw sequence.
    Each extracted ITS1 or ITS2 sequence was assigned to the closest UNITE 10.0 Species Hypothesis using BLASTn against the Species Hypothesis (SH) dataset https://doi.org/10.15156/BIO/3301231 (Abarenkov et al., 2025) if sequence similarity was ≥ 98.5%.
    All sequences with the closest hit to SH not classified as Fungi were disregarded as nonfungal.
    All sequences with no hit to any SH were disregarded as were also those with the closest hit to SH classified as Fungi if (e-value > 10e−50) and (coverage + similarity < 180) as nonfungal.
    All sequences that were not assigned to fungal SH but retained as fungal were classified into the bin “all_other_fungal_sequences”.
    All sequences that were assigned to fungal SH classified to a certain fungal species by UNITE 10.0 were assigned to that species.
    All sequences that were assigned to fungal SH classified to a certain fungal genus by UNITE 10.0 were assigned to that genus.
    Each table contains observations of fungal taxa (SH / species / genera) as columns and samples as rows. The number in each cell represents the number of ITS sequences assigned to the corresponding taxon in the corresponding sample.
    Tables contain either observations of ITS1 sequences, ITS2 sequences, or both ITS1 + ITS2 sequences of the sample.

#### References

Abarenkov, K., Zirk, A., Piirmann, T., Pöhönen, R., Ivanov, F., Nilsson, R. H., Kõljalg, U., 2025. UNITE general FASTA release for eukaryotes. Version 19.02.2025. UNITE Community. [https://doi.org/10.15156/BIO/3301231](https://doi.org/10.15156/BIO/3301231).

Bengtsson-Palme, J., Ryberg, M., Hartmann, M., Branco, S., Wang, Z., Godhe, A., De Wit, P., Sánchez-García, M., Ebersberger, I., de Sousa, F., Amend, A.S., Jumpponen, A., Unterseher, M., Kristiansson, E., Abarenkov, K., Bertrand, Y.J.K., Sanli, K., Eriksson, K.M., Vik, U., Veldre, V., Nilsson, R.H., 2013. Improved software detection and extraction of ITS1 and ITS2 from ribosomal ITS sequences of fungi and other eukaryotes for analysis of environmental sequencing data. Methods in Ecology and Evolution 4, 914-919. [https://doi.org/10.1111/2041-210x.12073](https://doi.org/10.1111/2041-210x.12073).

 
