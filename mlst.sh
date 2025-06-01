#!/bin/bash

# Fixed MLST processing script
INPUT_DIR="/home/kien1211/Downloads/fasta"
OUTPUT_DIR="/home/kien1211/Downloads/mlst"
OUTPUT_FORMAT="tsv"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Process each FASTA file in the input directory
for file in "$INPUT_DIR"/ERR*.fasta; do
    # Check if file exists (in case no matching files)
    if [[ ! -f "$file" ]]; then
        echo "No matching files found: $INPUT_DIR/ERR*.fasta"
        break
    fi
    
    # Get basename without extension
    basename=$(basename "$file" .fasta)
    
    # Define output file
    output_file="$OUTPUT_DIR/${basename}_mlst.${OUTPUT_FORMAT}"
    
    echo "Processing: $file"
    
    # Run MLST and extract columns 1 and 3 (filename and ST)
    mlst --scheme abaumannii_2 "$file" | cut -f1,3 > "$output_file"
    
    echo "Output saved to: $output_file"
done

echo "MLST processing completed!"

