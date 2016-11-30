awk '{print $1}' test.$1-$2 >test.$1
awk '{print $2}' test.$1-$2 >test.$2
x=`wc -l $3|cut -d " " -f 1`

tr "</S>" " " <$3|awk '{print $3}' >test.output
python utilities.py convert_to_nbest_format test.output test.output_nBest

seq 1 $x |  awk  '{print $0,1,0}' | sed 's, ,_,g' > test.id  #Depending on the number of test pairs. 

python utilities.py generate_news_2105_gold_standard test.$1 test.$2 test.gold.xml  $1$2 $x $1 $2
python utilities.py gen_news_output test.id test.gold.xml test.output_nBest test.predicted.xml run $1$2 $1 $2
python news_evaluation.py -t test.gold.xml -i test.predicted.xml > result.$1-$2
cat result.$1-$2
