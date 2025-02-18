library("trackplot")

#Path to bigWig files
bigWigs = c("heart_coronary_artery_51f_RAD21_hg38.bigWig.bw",
"heart_coronary_artery_51f_SMC3_hg38.bigWig.bw",
"heart_coronary_artery_51f_CTCF_hg38.bigWig.bw")

#Step-1. Extract the signal for your loci of interst
track_data = track_extract(bigWigs = bigWigs, loci = "chr13:110,372,276-110,422,276")

#Step-1a (optional). Summarize trcks by condition
track_data = track_summarize(summary_list = track_data, condition = c("CTCF", "SMC3", "RAD21"), stat = "mean")

#Step-2. 
#Basic Plot 
#track_plot(summary_list = track_data)

#With gene models (by default autoamtically queries UCSC genome browser for hg19 transcripts)
#track_plot(summary_list = track_data, draw_gene_track = TRUE, build = "hg19")

#Heighlight regions of interest
#chr1:205713378
markregions = data.frame(
    chr = "chr13",
    start = 110397126,
    end = 110397426,
    name = c("rs9515203")
  )

pdf(file = "coronary_artery_51f_rs9515203_gpc6_trackplot.pdf")
track_plot(
  summary_list = track_data,
  draw_gene_track = TRUE,
  show_ideogram = TRUE,
  build = "hg38",
  regions = markregions
)
dev.off()