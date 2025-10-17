#!/bin/bash

# Local Android Setup Helper
# This script helps developers setup local Android signing
# WITHOUT exposing secrets in git repository

echo "🔐 Android Local Development Setup"
echo "=================================="

ANDROID_DIR="app/android"
KEY_PROPERTIES="$ANDROID_DIR/key.properties"
TEMPLATE_FILE="$ANDROID_DIR/key.properties.template"

# Check if already setup
if [ -f "$KEY_PROPERTIES" ]; then
    echo "✅ key.properties already exists"
    echo "📄 Current configuration:"
    cat "$KEY_PROPERTIES" | grep -v "Password" | sed 's/=.*/=***/'
    exit 0
fi

echo ""
echo "📋 Setup Steps:"
echo "1. Place your .jks keystore file in: $ANDROID_DIR/"
echo "2. We'll create key.properties from your input"
echo ""

# Get keystore file
echo "🔑 Keystore Setup:"
read -p "Enter your keystore filename (e.g., my_app.jks): " KEYSTORE_FILE
read -p "Enter your key alias: " KEY_ALIAS
read -s -p "Enter your store password: " STORE_PASSWORD
echo ""
read -s -p "Enter your key password (press Enter if same as store): " KEY_PASSWORD
echo ""

# Use store password if key password is empty
if [ -z "$KEY_PASSWORD" ]; then
    KEY_PASSWORD="$STORE_PASSWORD"
fi

# Create key.properties
cat > "$KEY_PROPERTIES" << EOF
keystore.storeFile=../$KEYSTORE_FILE
keystore.storePassword=$STORE_PASSWORD
keystore.keyAlias=$KEY_ALIAS
keystore.keyPassword=$KEY_PASSWORD
EOF

echo ""
echo "✅ Created $KEY_PROPERTIES"
echo "🔒 This file is already in .gitignore (safe from commits)"
echo ""
echo "📱 You can now build release APK/AAB locally:"
echo "   make build_prod_apk"
echo "   make build_prod_bundle"
echo ""
echo "🚨 REMEMBER:"
echo "   - Never commit key.properties"
echo "   - Never commit .jks files"
echo "   - Use GitHub Secrets for CI/CD"