For evaluation of Top1 accuracy and F scores

Place your predicted.txt in test_platform/
Execute:

./eval.sh SrcLang_code TrgtLang_code  predicted_filename

Example: ./eval.sh En Hi test_out_9

To remove useless files
./clean.sh En Hi 

Result produced in result.En-Hi