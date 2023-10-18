#! /bin/bash

# This shell script is written by Yash Arya.
# Special thanks to https://www.github./com/skushagra for helping.
# This script is written for compressing PDF files.

input=$(zenity --file-selection --title="Select a File")


if [ $? -eq 1 ]; then
    echo "No file selected."
    exit 1
fi

path=$(dirname "$input")
filename=$(basename "$input" .pdf)

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=""$path"/""$filename"\ compressed.pdf"" "$input"

outputfile="$path/"$filename\ compressed.pdf""

if [ -f "$outputfile" ]; then
    echo "File compressed successfully."
else
    echo "The file didn't compress"
    exit 2
fi
