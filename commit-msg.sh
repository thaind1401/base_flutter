#!/bin/bash
echo "📝 Checking commit message format..."

# Read commit message from file
commit_message_file=$1
commit_message=$(cat "$commit_message_file")

echo "Commit message: '$commit_message'"

# Allow merge commits
if echo "$commit_message" | grep -q "^Merge "; then
    echo "✅ Merge commit detected - skipping format check"
    exit 0
fi

# Allow revert commits
if echo "$commit_message" | grep -q "^Revert "; then
    echo "✅ Revert commit detected - skipping format check"
    exit 0
fi

# Check if commit message follows basic format
# Accept formats like:
# - [TASK-123] Some description
# - feat: add new feature
# - fix: resolve issue
# - docs: update documentation
# - Or any message with reasonable length

if [ ${#commit_message} -lt 10 ]; then
    echo "❌ Commit message too short (minimum 10 characters)"
    echo "💡 Please provide a more descriptive commit message"
    exit 1
fi

if [ ${#commit_message} -gt 100 ]; then
    echo "❌ Commit message too long (maximum 100 characters)"
    echo "💡 Please keep commit message concise"
    exit 1
fi

# Check for common patterns
if echo "$commit_message" | grep -qE "^(feat|fix|docs|style|refactor|test|chore|build|ci|perf):" || \
   echo "$commit_message" | grep -qE "^\[[A-Z]+-[0-9]+\]" || \
   echo "$commit_message" | grep -qE "^[A-Z]"; then
    echo "✅ Commit message format is acceptable"
    exit 0
fi

# If no pattern matches, still allow but give suggestion
echo "⚠️  Commit message doesn't follow conventional format"
echo "💡 Consider using: feat:, fix:, docs:, or [TASK-123] prefix"
echo "✅ Allowing commit anyway"
exit 0