#!/bin/bash

function create_files {
  local name=$1
  local start_num=$2

  for ((i=1; i<=25; i++)); do
    num=$((start_num + i))
    touch "$name$num"
  done
}

name="Ivan"
last_file_num=$(ls -1 "$name"* 2> /dev/null | grep -oE '[0-9]+$' | sort -g | tail -1)

if [ -z "$last_file_num" ]; then
  start_num=0
else
  start_num=last_file_num
fi

create_files "$name" "$start_num"
