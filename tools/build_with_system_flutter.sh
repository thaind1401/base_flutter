#!/bin/bash

# Helper script to build with system Flutter (workaround for FVM issues)

echo "🔄 Switching to system Flutter for build_runner..."

# Backup current PATH
ORIGINAL_PATH="$PATH"

# Use system Flutter (adjust path as needed)
export PATH="/usr/local/bin/flutter:/opt/homebrew/bin/flutter:$PATH"

echo "📋 Current Flutter version:"
flutter --version

echo ""
echo "🔨 Running build_runner for all modules..."

# Build each module individually
modules=("data" "domain" "shared" "app")

for module in "${modules[@]}"; do
    echo ""
    echo "🔨 Building $module module..."
    
    if [ -d "$module" ]; then
        cd "$module"
        
        if dart run build_runner build --delete-conflicting-outputs; then
            echo "✅ $module build completed successfully"
        else
            echo "❌ $module build failed"
        fi
        
        cd ..
    else
        echo "⚠️  Module directory '$module' not found"
    fi
done

echo ""
echo "🔄 Restoring original PATH..."
export PATH="$ORIGINAL_PATH"

echo "✅ Build process completed!"
echo ""
echo "💡 Tip: You can now continue using FVM for regular development"