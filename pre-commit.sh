#!/bin/bash
echo "🔍 Running pre-commit checks..."

# Check if there are any staged files
if git diff --cached --quiet; then
    echo "✅ No staged files to check"
    exit 0
fi

echo "📁 Checking staged files..."

# Get staged Dart files
STAGED_DART_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.dart$' | grep -v '\.g\.dart$' | grep -v '\.freezed\.dart$' | grep -v '\.gr\.dart$' | grep -v '\.config\.dart$' | head -10)

if [ -z "$STAGED_DART_FILES" ]; then
    echo "✅ No Dart files staged for commit"
    exit 0
fi

echo "🎯 Found staged Dart files:"
echo "$STAGED_DART_FILES"

# Basic syntax check for staged Dart files
echo "🔍 Running basic syntax check..."
for file in $STAGED_DART_FILES; do
    if [ -f "$file" ]; then
        # Simple syntax check using dart analyze on individual files
        dart analyze "$file" --fatal-infos 2>/dev/null
        if [ $? -ne 0 ]; then
            echo "❌ Syntax error in $file"
            echo "💡 Please fix syntax errors before committing"
            exit 1
        fi
    fi
done

echo "✅ Pre-commit checks passed!"
exit 0