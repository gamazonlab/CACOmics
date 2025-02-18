library("trackplot")

#Path to bigWig files
bigWigs = c("heart_coronary_artery_51f_H3K79me2_hg38.bigWig.bw", "heart_coronary_artery_51f_H4K20me1_hg38.bigWig.bw", "heart_coronary_artery_51f_H3K36me3_hg38.bigWig.bw", "heart_coronary_artery_51f_ATAC-seq_hg38.bigWig.bw")

#Step-1. Extract the signal for your loci of interst
track_data = track_extract(bigWigs = bigWigs, loci = "chr15:78,773,264-78,823,264")

#Step-1a (optional). Summarize trcks by condition
track_data = track_summarize(summary_list = track_data, condition = c("H3K79me2", "H4K20me1", "H3K36me3", "ATAC-seq"), stat = "mean")

#Step-2. 
#Basic Plot 
#track_plot(summary_list = track_data)

#With gene models (by default autoamtically queries UCSC genome browser for hg19 transcripts)
#track_plot(summary_list = track_data, draw_gene_track = TRUE, build = "hg19")

#Heighlight regions of interest
#chr1:205713378
markregions = data.frame(
    chr = "chr15",
    start = 78798114,
    end = 78798414,
    name = c("rs28610385")
  )

pdf(file = "heart_coronary_artery_51f_rs28610385_rpp25_trackplot.pdf")
track_plot(
  summary_list = track_data,
  draw_gene_track = TRUE,
  show_ideogram = TRUE,
  build = "hg38",
  regions = markregions
)
dev.off()