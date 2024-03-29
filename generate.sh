#!/bin/bash - 

if [[ $1 == "" && $2 == "" ]]; then
  echo -e "
error: missing required parameter..
usage: ./generate.sh [input] [output]
";
  exit;
fi

[[ ! -d $2 ]] && mkdir $2;

for i in $(cd $1 && find -type f -name "*.proto"); do
	protoc -I=$1 --go_out=$2 --go_opt=paths=source_relative --go-grpc_out=$2 --go-grpc_opt=paths=source_relative $1/$(basename $i)
done
