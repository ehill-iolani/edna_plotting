require(ggplot2)

source("summary_function.R")

s1 <- read_summary("summary_BLAST_Medaka_barcode07_concatenated.txt")
s2 <- read_summary("summary_BLAST_Medaka_barcode08_concatenated.txt")
s3 <- read_summary("summary_BLAST_Medaka_barcode09_concatenated.txt")
s4 <- read_summary("summary_BLAST_Medaka_barcode10_concatenated.txt")
s5 <- read_summary("summary_BLAST_Medaka_barcode11_concatenated.txt")
s6 <- read_summary("summary_BLAST_Medaka_barcode12_concatenated.txt") # something funny
s7 <- read_summary("summary_BLAST_Medaka_barcode19_concatenated.txt")
s8 <- read_summary("summary_BLAST_Medaka_barcode20_concatenated.txt") # something funny
s9 <- read_summary("summary_BLAST_Medaka_barcode21_concatenated.txt")
s10 <- read_summary("summary_BLAST_Medaka_barcode22_concatenated.txt")
s11 <- read_summary("summary_BLAST_Medaka_barcode23_concatenated.txt")
s12 <- read_summary("summary_BLAST_Medaka_barcode24_concatenated.txt")

p1 <- edna_plots(s1) + ggtitle("Ava 07.12.2022 \nBarcode07 \nProportions of Total Reads")
p2 <- edna_plots(s2) + ggtitle("Ava 07.12.2022 \nBarcode08 \nProportions of Total Reads")
p3 <- edna_plots(s3) + ggtitle("Ava 07.12.2022 \nBarcode09 \nProportions of Total Reads")
p4 <- edna_plots(s4) + ggtitle("Ava 07.12.2022 \nBarcode10 \nProportions of Total Reads")
p5 <- edna_plots(s5) + ggtitle("Ava 07.12.2022 \nBarcode11 \nProportions of Total Reads")
p6 <- edna_plots(s6) + ggtitle("Ava 07.12.2022 \nBarcode12 \nProportions of Total Reads")
p7 <- edna_plots(s7) + ggtitle("Ava 07.12.2022 \nBarcode19 \nProportions of Total Reads")
p8 <- edna_plots(s8) + ggtitle("Ava 07.12.2022 \nBarcode20 \nProportions of Total Reads")
p9 <- edna_plots(s9) + ggtitle("Ava 07.12.2022 \nBarcode21 \nProportions of Total Reads")
p10 <- edna_plots(s10) + ggtitle("Ava 07.12.2022 \nBarcode22 \nProportions of Total Reads")
p11 <- edna_plots(s11) + ggtitle("Ava 07.12.2022 \nBarcode23 \nProportions of Total Reads")
p12 <- edna_plots(s12) + ggtitle("Ava 07.12.2022 \nBarcode24 \nProportions of Total Reads")

pdf("Ava's_07122022_eDNA_Sequencing_Run.pdf", height = 5, width = 7)
  p1
  p2
  p3
  p4
  p5
  p6
  p7
  p8
  p9
  p10
  p11
  p12
dev.off()

write.csv(s1, "barcode07_read_breakdown.csv", row.names = F)
write.csv(s2, "barcode08_read_breakdown.csv", row.names = F)
write.csv(s3, "barcode09_read_breakdown.csv", row.names = F)
write.csv(s4, "barcode10_read_breakdown.csv", row.names = F)
write.csv(s5, "barcode11_read_breakdown.csv", row.names = F)
write.csv(s6, "barcode12_read_breakdown.csv", row.names = F)
write.csv(s7, "barcode19_read_breakdown.csv", row.names = F)
write.csv(s8, "barcode20_read_breakdown.csv", row.names = F)
write.csv(s9, "barcode21_read_breakdown.csv", row.names = F)
write.csv(s10, "barcode22_read_breakdown.csv", row.names = F)
write.csv(s11, "barcode23_read_breakdown.csv", row.names = F)
write.csv(s12, "barcode24_read_breakdown.csv", row.names = F)

