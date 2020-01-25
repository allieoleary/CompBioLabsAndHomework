cut -f 2-4 -d, PredPreyDataCopy.csv >PredPreyData1.csv
head -n 1 PredPreyData1.csv >PredPreyDataFinal.csv
tail PredPreyData1.csv >>PredPreyDataFinal.csv
