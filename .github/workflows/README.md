# 🔄 GitHub Actions CI/CD

This directory contains GitHub Actions workflows for automated CI/CD pipeline.

## 📋 Workflows Overview

### 1. **`ci.yml`** - Main CI/CD Pipeline  
**Triggers:** Push to `main`/`develop`, Pull Requests
- 🔍 **Quality Check**: Format, analyze, test, coverage
- 🤖 **Android Build**: APK + App Bundle (Production only)
- 🍎 **iOS Build**: iOS build + IPA (Production only, macOS runner)
- 🚀 **Deploy**: Template for store deployment

### 2. **`pr-check.yml`** - Pull Request Validation
**Triggers:** Pull Request to `main`/`develop`
- ⚡ **Fast validation**: Format, analyze, test (20 min timeout)
- 🔍 **Quality gates** for PR reviews
- 🧹 **No builds** - focus on code quality

### 3. **`release.yml`** - Release & Deploy
**Triggers:** Git tags (`v*.*.*`) from `main` branch, Manual dispatch
- 🏷️ **Version management** from git tags
- 📦 **Production release builds** only
- 📝 **GitHub releases** with artifacts
- 🔒 **Main branch only** - production-ready releases

## 🛠️ Environment Configuration

```yaml
FLUTTER_VERSION: '3.32.8'  # Matches your FVM version
MELOS_VERSION: '6.3.0'     # Matches your project
JAVA_VERSION: '17'          # Required for Android Gradle Plugin 8.x
```

## 🎯 Build Strategy (Production Only)

**Current Focus:** Production builds only for simplified CI/CD
- **Production environment** - Release-ready builds
- **Simplified workflow** - Faster, more reliable
- **Quality first** - Comprehensive testing before builds

## 📱 Build Artifacts

### Android
- **APK**: `app/build/app/outputs/flutter-apk/*.apk`
- **App Bundle**: `app/build/app/outputs/bundle/*Release/*.aab`

### iOS  
- **iOS Build**: `app/build/ios/`
- **IPA**: `app/build/ios/ipa/*.ipa` (Main branch push only)

### Artifact Retention
- **CI builds**: 30 days
- **Release builds**: 90 days

## 🚀 Usage Examples

### Development Workflow
```bash
# 1. Create feature branch
git checkout -b feature/awesome-feature
git push origin feature/awesome-feature

# 2. Open PR → Triggers pr-check.yml (quality only)
# 3. Merge to main → Triggers ci.yml (full build)
```

### Release Workflow
```bash
# 1. Ensure you're on main branch
git checkout main
git pull origin main

# 2. Create and push release tag
git tag v1.0.0
git push origin v1.0.0

# 3. Triggers release.yml → Production build + GitHub Release
```

### Manual Release
Go to GitHub Actions → "Release & Deploy" → "Run workflow"
- Environment: production (only option)
- Click "Run workflow"

## 🔧 Integration with Make Commands

All workflows use your existing `makefile` commands:
- `make sync` - Bootstrap dependencies with Melos
- `make gen_env` - **Generate environment files** (Required for builds)
- `make build_all` - Generate code with build_runner
- `make test` - Run all tests
- `make analyze_*` - Static analysis per module
- `make build_prod_apk` - Build production APK
- `make build_prod_bundle` - Build production App Bundle
- `make build_prod_ios` - Build production iOS
- `make build_prod_ipa` - Build production IPA

## 📊 Quality Gates

### ✅ pr-check.yml (Required for PR merge)
- 🧹 Clean build artifacts
- 🎨 Code formatting check (currently disabled - CI/local differences)
- 🔨 Code generation (build_runner)
- 🔍 Static analysis (all modules)
- 🧪 Unit tests

### ✅ ci.yml (Full CI pipeline)
- All pr-check.yml checks +
- 🤖 Android APK + App Bundle builds
- 🍎 iOS builds (main/develop only)
- 📊 Code coverage
- 📈 Code metrics

### ✅ release.yml (Production release)
- 🧪 Tests
- 🔨 Production App Bundle build
- 📝 GitHub Release creation
- 📦 Artifact upload (90 days)

## 🔒 Required GitHub Secrets

For Android signing and future deployment:
- `ANDROID_KEYSTORE` - Base64 encoded Android keystore (.jks)
- `ANDROID_STORE_PASSWORD` - Keystore password
- `ANDROID_KEY_PASSWORD` - Key password  
- `ANDROID_KEY_ALIAS` - Key alias

## ⚙️ Technical Details

### Android Setup
- **Java 17** - Required for modern Android Gradle Plugin
- **Gradle wrapper** - Included in repository for CI consistency
- **local.properties** - Generated dynamically in CI
- **Keystore management** - Secure base64 encoding/decoding

### Environment Files
- **Generated automatically** - `make gen_env` creates required env files
- **CI requirement** - Build scripts expect env files to exist
- **Production focus** - Only production environment configured

## 🎉 Benefits

1. **Simplified & Reliable**: Production-only builds reduce complexity
2. **Quality First**: Comprehensive testing before any builds
3. **Fast Feedback**: PR checks in ~20 minutes
4. **Secure**: Proper Android keystore management
5. **Consistent**: Same build process locally and in CI
6. **Version Control**: Git tag-based releases with automatic versioning
7. **Future Ready**: Template ready for store deployment automation

1. **Simplified & Reliable**: Production-only builds reduce complexity
2. **Quality First**: Comprehensive testing before any builds
3. **Fast Feedback**: PR checks in ~20 minutes
4. **Secure**: Proper Android keystore management
5. **Consistent**: Same build process locally and in CI
6. **Version Control**: Git tag-based releases with automatic versioning
7. **Future Ready**: Template ready for store deployment automation