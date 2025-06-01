#!/bin/bash
#
#metadata
SAMPLES=meta_data.csv
#
while IFS=, read -r field1 field2  

do  
    echo RUNNING ${field1} 
    echo "label : $field1" 
    echo "strain_name : $field2"
    field2=$(echo "${field2}" | tr -d '\r\n' | sed 's/[[:space:]]*$//')

    fasta_file="./fasta/${field2}.fasta"

    java -jar UBCG2.jar -i "${fasta_file}" -ucg_dir path -label ${field1} -strain_name ${field2} -hmm hmm/ubcg_v2.hmm
    echo DONE ${field1} 

done < ${SAMPLES}
