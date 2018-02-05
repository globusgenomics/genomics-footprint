#------------------------------------------------
#
#  Before running the script, please make sure:
#  (1) gunzip the seqneuce files
#  (2) install meme and psql
#  (3) change the home directory
#------------------------------------------------


# change to your home directory here
HOME = paste(Sys.getenv("HOME"),"/Documents/GitHub/genomics-footprint/generate_motif",sep="")

tool_path = paste(Sys.getenv("HOME"),"/meme/bin/fimo",sep="")
output = paste(HOME,"/fimo_output",sep="")

fimo_motif = paste(HOME,"/fimo_input/motif/non-redundant_fimo_motifs.meme",sep="")
test_motif = paste(HOME,"/fimo_input/motif/fimo_test_motif.meme",sep="")
seq_full_list = list.files(path=paste(HOME,"/fimo_input/hg38",sep=""), pattern="fa",full.names=TRUE)

parameters = "--text --oc . --no-qvalue"

# test run with 1 motif and MT sequence
fimo_test_cmd = paste(tool_path, " ", parameters, " ", fimo_motif, " ", seq_full_list[23], " > ", output, "/", basename(seq_full_list[23]), ".txt", sep="")
db_test_cmd = paste(HOME,"/script/create_fimo_test.sh",sep="")
system(db_test_cmd, intern = TRUE)
