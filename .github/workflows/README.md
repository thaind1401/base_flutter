# 🔄 GitHub Actions CI/CD

This directory contains GitHub Actions workflows for automated CI/CD pipeline.

## 📋 Workflows Overview

### 1. **`ci.yml`** - Main CI/CD Pipeline
**Triggers:** Push to `main`/`develop`, Pull Requests
- ✅ **Quality Check**: Format, analyze, test, coverage
- 🤖 **Android Build**: APK + App Bundle for all environments
- 🍎 **iOS Build**: iOS build + IPA (macOS runner)
- 🚀 **Deploy**: Automated deployment to stores

### 2. **`pr-check.yml`** - Pull Request Validation
**Triggers:** Pull Request to `main`/`develop`
- 🔍 **Fast validation**: Format, analyze, test
- ⚡ **Quick feedback** for PR reviews

### 3. **`release.yml`** - Release & Deploy
**Triggers:** Git tags (`v*.*.*`), Manual dispatch
- 🏷️ **Version management** from git tags
- 📦 **Release builds** for production/staging
- 📝 **GitHub releases** with artifacts

## 🛠️ Environment Variables

```yaml
FLUTTER_VERSION: '3.32.8'  # Matches your FVM version
MELOS_VERSION: '6.3.0'     # Matches your project
```

## 🎯 Supported Environments

- **develop** - Development builds
- **qa** - QA testing builds  
- **staging** - Pre-production builds
- **production** - Release builds

## 📱 Build Artifacts

### Android
- **APK**: `app/build/app/outputs/flutter-apk/*.apk`
- **App Bundle**: `app/build/app/outputs/bundle/*Release/*.aab`

### iOS  
- **iOS Build**: `app/build/ios/`
- **IPA**: `app/build/ios/ipa/*.ipa`

## 🚀 Usage Examples

### Trigger CI on Pull Request
```bash
git checkout -b feature/your-feature
git push origin feature/your-feature
# Open PR → Triggers pr-check.yml
```

### Trigger Release Build
```bash
git tag v1.0.0
git push origin v1.0.0
# Triggers release.yml → Production build
```

### Manual Deployment
Go to GitHub Actions → "Release & Deploy" → "Run workflow"
- Choose environment: staging/production
- Click "Run workflow"

## 🔧 Integration with Make Commands

All workflows use your existing `makefile` commands:
- `make sync` - Bootstrap dependencies
- `make test` - Run all tests
- `make format` - Code formatting
- `make analyze_*` - Static analysis
- `make build_*_apk` - Build APK
- `make build_*_bundle` - Build App Bundle

## 📊 Quality Gates

### ✅ Required Checks (Block PR merge)
- Code formatting (dart format)
- Static analysis (flutter analyze)
- Unit tests (flutter test)

### ⚠️ Optional Checks (Warning only)
- Code coverage
- Code metrics

## 🔒 Secrets Configuration

For deployment, add these secrets in GitHub Settings:
- `ANDROID_KEYSTORE` - Android signing keystore
- `ANDROID_KEY_ALIAS` - Keystore alias
- `ANDROID_KEY_PASSWORD` - Key password
- `PLAY_STORE_SERVICE_ACCOUNT` - Google Play service account
- `APP_STORE_CONNECT_API_KEY` - Apple App Store Connect API

## 🎉 Benefits

1. **Automated Quality**: Every commit is tested
2. **Multi-Environment**: Build for all environments automatically  
3. **Parallel Builds**: Android + iOS builds run simultaneously
4. **Artifact Storage**: Built APKs/IPAs stored for 30-90 days
5. **Release Management**: Automated releases with git tags
6. **Integration**: Works with existing makefile + melos setup