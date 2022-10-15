##########################
###                    ###
### Only run this the  ###
### the first time you ###
### install a package  ###
###                    ###
##########################

#install.packages("ggplot2")


################################
###                          ###
### Custom function to check ###
### for 0 length integers    ###
###                          ###
################################

is.integer0 <- function(x){
  is.integer(x) && length(x) == 0L
}


###########################
###                     ###
### Processing the data ###
###                     ###
###########################

# Calls the required packages
require(ggplot2)

# To make sure the data formats properly
options(stringsAsFactors = F)

# Reads in the blast results from 
dat <- read.table("summary_BLAST_Medaka_barcode07_concatenated.txt", sep = "\t", header = F, skip = 1, col.names = paste0("V",seq_len(100)), fill = TRUE)

# Checks for 0 length integers in the data
check <- grep("TRUE", is.na(dat$V1))

# Makes new data frame with only the rows we want

if(is.integer0(check) == TRUE){
  sdat <- dat[,c(1, 4, 8, 11, 12)]
}else{
  dat <- dat[-c(grep("TRUE", is.na(dat$V1))),]
  sdat <- dat[,c(1, 4, 8, 11, 12)]
}


# Renames the columns with proper labels
names(sdat) <- c("reads", "percent_id", "e_value", "genus", "species")

# Fills in blanks in %id column
sdat$percent_id[grep("TRUE", is.na(sdat$percent_id))] <- 0

# Sums all of the clustered reads to get total number of reads
totalreads <- sum(sdat$reads)

# Filters data to only retain BLAST hits wth >95$ %id
idat <- sdat[grep("TRUE", sdat$percent_id > 95),]

# Generates new columns by joining genus and species with "_"
idat$gensp <- paste(idat$genus, idat$species, sep = "_")

# Stores all unique genus species combinations in an object
gensp <- unique(idat$gensp)

# Generates empty dataframe called output
output <- data.frame()

# For loop that sums the number of reads for each unique genus species combination
for(i in gensp){
  gensp_reads <- idat[grep(i, idat$gensp),]
  reads <- sum(gensp_reads$reads)
  read_gensp <- c(i, reads)
  output <- rbind(output, read_gensp)
}

# Renames the dataframe that stored the output of the for loop
names(output) <- c("gensp", "reads")

# Converts reads from a character string to a numeric
output <- transform(output, reads = as.numeric(reads))

# Finds the total number of unclassified reads
other <- totalreads - sum(output$reads)

# Names the unclassified reads
other <- c("Unclassified", other)

# Binds the unclassified reads to the bottom of the data frame
output <- rbind(output, other)

# Names the total reads
totalreads <- c("Total_Reads", totalreads)

# Binds the total reads to the bottom of the data frame
output <- rbind(output, totalreads)

# Converts reads from character to numeric 
output <- transform(output, reads = as.numeric(reads))

# Calculates read percentage by gensp
output$read_percentage <- cbind(output$reads/output$reads[length(output$reads)]*100)

# Converts read_percentage from character to numeric
output <- transform(output, read_percentage = as.numeric(read_percentage))


#########################
###                   ###
### Plotting the data ###
###                   ###
#########################

# Stores output in another object
x <- output

# Filters out reads we do not want to plot
index <- grep("TRUE", x$gensp == "Pseudorca_crassidens")
x <- x[-c(index),]
index <- grep("TRUE", x$gensp == "Unclassified")
x <- x[-c(index),]
index <- grep("TRUE", x$gensp == "Total_Reads")
x <- x[-c(index),]

# Rounds read percentage
x$read_percentage <- round(x$read_percentage, 2)

# Makes read percentage look pretty
x$read_percentage <- paste(x$read_percentage, "%", sep = "")

# Actually does the plotting
ggplot(x, aes(x="", y=reads, fill=gensp)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y") +
  theme_void() 































#####################
###               ###   
### So wow!       ###
### Very Code!1!! ###
### Much Cool!!1! ###
###               ###
#####################