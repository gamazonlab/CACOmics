EPIMAP_SAMPLES=("heart_coronary_artery_51f")

for SAMPLE in "${EPIMAP_SAMPLES[@]}"; do
python /home/bettimj/gamazon_rotation/mod_core-bed/astrocyte/trackplot/epimap_download_bigwig.py \
-g hg19 \
-t $SAMPLE \
-v \
-r /home/bettimj/gamazon_rotation/cac_locuszoom/trackplot
done