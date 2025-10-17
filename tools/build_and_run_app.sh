#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # base_flutter_project/tools
root_project_path=$(dirname $parent_path)
env_path="$root_project_path/env/$1.env"

echo "🔍 Debug paths:"
echo "  Script location: $parent_path"
echo "  Root project: $root_project_path"
echo "  Env file path: $env_path"
echo "  Checking if env file exists..."

if [ ! -f "$env_path" ]; then
    echo "❌ Environment file not found: $env_path"
    echo "📁 Available files in env directory:"
    ls -la "$root_project_path/env/" 2>/dev/null || echo "  env directory does not exist"
    exit 1
fi

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
