#!/bin/bash

download_and_extract() {
  local filename=`basename "$1"`
  local filename_ex=${filename%.gz}

  # Extract file if json not there
  if [ ! -f "$filename_ex" ]
  then
    # Download original file if not there
    if [ ! -f "$filename" ]
    then
      echo "Downloading $filename"
      wget -q "$1"
    fi
    echo "Extracting to $filename_ex"
    gzip -d "$filename"
  else
    echo "Nothing to do: $filename_ex already exists"
  fi
}

CATEGORY_NAME_URL=$1

download_and_extract "http://deepyeti.ucsd.edu/jianmo/amazon/categoryFiles/"$CATEGORY_NAME_URL".json.gz"
download_and_extract "http://deepyeti.ucsd.edu/jianmo/amazon/metaFiles2/meta_"$CATEGORY_NAME_URL".json.gz"
