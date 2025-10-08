#!/bin/bash
# Script để giải quyết vấn đề FVM + build_runner compatibility

echo "🔧 Fixing FVM + build_runner compatibility issues..."

# Giải pháp 1: Update build_runner lên version mới nhất
echo "📦 Updating build_runner to latest version..."

# Kiểm tra trong từng module
MODULES=("app" "data" "domain" "shared")

for module in "${MODULES[@]}"; do
    if [ -d "$module" ] && [ -f "$module/pubspec.yaml" ]; then
        echo "🔄 Updating $module..."
        cd "$module"
        
        # Check if build_runner exists in pubspec.yaml
        if grep -q "build_runner:" pubspec.yaml; then
            echo "  📋 Found build_runner in $module"
            
            # Update build_runner version
            sed -i '' 's/build_runner: .*/build_runner: ^2.9.0/' pubspec.yaml
            
            # Also update related packages
            sed -i '' 's/build_runner_core: .*/build_runner_core: ^9.3.2/' pubspec.yaml 2>/dev/null || true
            sed -i '' 's/frontend_server_client: .*/frontend_server_client: ^4.0.0/' pubspec.yaml 2>/dev/null || true
            
            echo "  ✅ Updated build_runner in $module"
        else
            echo "  ⏭️  No build_runner in $module"
        fi
        
        cd ..
    fi
done

# Giải pháp 2: Clear và rebuild dependencies
echo "🧹 Cleaning and rebuilding dependencies..."
melos clean
melos bootstrap

echo "🚀 Trying to run build_runner with updated versions..."

# Test với app module
cd app
echo "🧪 Testing build_runner in app module..."

# Thử với các options khác nhau
echo "  🔸 Method 1: Standard build..."
dart run build_runner build --delete-conflicting-outputs || {
    echo "  ❌ Method 1 failed, trying method 2..."
    
    echo "  🔸 Method 2: Build with verbose output..."
    dart run build_runner build --delete-conflicting-outputs --verbose || {
        echo "  ❌ Method 2 failed, trying method 3..."
        
        echo "  🔸 Method 3: Using flutter packages instead..."
        flutter packages pub run build_runner build --delete-conflicting-outputs || {
            echo "  ❌ All methods failed."
            echo "  💡 Try manual workaround:"
            echo "     1. cd app"
            echo "     2. dart pub cache clean"
            echo "     3. dart pub get"
            echo "     4. dart pub global activate build_runner"
            echo "     5. dart pub global run build_runner build"
        }
    }
}

cd ..
echo "✨ Fix script completed!"