#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # base_flutter_project/tools
root_project_path=$(dirname $parent_path)
env_path="$root_project_path/env/$1.env"

dart_define=""
while read line || [ -n "$line" ]; do
    if [[ $line =~ ^[A-Za-z_]+=.*$ ]]; then
        dart_define+="--dart-define $line "
    fi
done < $env_path

cd "$root_project_path/app"
# $1: develop
# $2: build/run
# $3 (optional): apk/appbundle/ios/ipa
# $4 (optional): --export-options-plist=ios/exportOptions.plist
cmd="flutter $2 $3 $4 -t lib/main.dart --flavor $1 $dart_define"
echo $cmd
eval $cmd
