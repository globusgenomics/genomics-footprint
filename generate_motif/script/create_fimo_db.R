#------------------------------------------------
#
#  Before running the script, please make sure:
#  (1) gunzip the seqneuce files
#  (2) install the psql program
#  (3) change the home directory
#  (4) make sure your postgres DB is running
#------------------------------------------------


# change to your home directory here
HOME = "/your_home_directory/genomics-footprint/generate_motif"


tool_path = paste(Sys.getenv("HOME"),"/meme/bin/fimo",sep="")
output = paste(HOME,"/fimo_output",sep="")

fimo_motif = paste(HOME,"/fimo_input/motif/non-redundant_fimo_motifs.meme",sep="")
test_motif = paste(HOME,"/fimo_input/motif/fimo_test_motif.meme",sep="")
seq_full_list = list.files(path=paste(HOME,"/fimo_input/hg38",sep=""), pattern="fa",full.names=TRUE)

parameters = "--text --oc . --no-qvalue"

# run fimo against GRCh38 sequences

for (i in 1:length(seq_full_list)) {
  fimo_cmd = paste(tool_path, " ", parameters, " ", fimo_motif, " ", seq_full_list[i], " > ", output, "/", basename(seq_full_list[i]), ".txt", sep="")
  system(cmd, intern = TRUE)
}

# create a fimo database
db_cmd = paste(HOME,"/script/create_fimo.sh",sep="")
system(db_cmd, intern = TRUE)
