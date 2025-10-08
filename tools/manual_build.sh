#!/bin/bash

# Alternative build script that bypasses FVM issues
# This script manually builds each module without melos/FVM

echo "🔧 Manual Build Script (FVM-free approach)"
echo "============================================"

MODULES=("data" "domain" "shared" "app")
BUILD_SUCCESS=0
BUILD_FAILED=0

echo ""
echo "📦 Building modules manually without FVM..."

for module in "${MODULES[@]}"; do
    echo ""
    echo "🔨 Building $module module..."
    
    if [ -d "$module" ]; then
        cd "$module"
        
        # Try different build approaches
        echo "   Attempting direct dart build_runner..."
        
        if dart pub get && dart run build_runner build --delete-conflicting-outputs --verbose; then
            echo "   ✅ $module build completed successfully"
            BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
        else
            echo "   ❌ $module build failed"
            echo "   📋 Trying alternative approach..."
            
            # Alternative: clean build
            if dart run build_runner clean && dart run build_runner build --delete-conflicting-outputs; then
                echo "   ✅ $module build completed (after clean)"
                BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
            else
                echo "   ❌ $module build failed completely"
                BUILD_FAILED=$((BUILD_FAILED + 1))
            fi
        fi
        
        cd ..
    else
        echo "   ⚠️  Module directory '$module' not found"
        BUILD_FAILED=$((BUILD_FAILED + 1))
    fi
done

echo ""
echo "📊 Build Summary:"
echo "   ✅ Successful: $BUILD_SUCCESS modules"
echo "   ❌ Failed: $BUILD_FAILED modules"

if [ $BUILD_FAILED -eq 0 ]; then
    echo "   🎉 All builds completed successfully!"
    exit 0
else
    echo "   ⚠️  Some builds failed. Check logs above."
    exit 1
fi