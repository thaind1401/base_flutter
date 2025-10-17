
# Base Flutter Project

A clean architecture Flutter project using FVM for version management and Melos for monorepo management.

## 📋 Requirements

- **Dart**: 3.8.1
- **Flutter SDK**: 3.32.8 (managed by FVM)
- **FVM**: 3.2.1+ (Flutter Version Management)
- **Melos**: 6.3.0+ (Monorepo management)
- **CocoaPods**: 1.12.0+ (iOS dependencies)

## 🚀 Quick Setup

### 1. Install Required Tools

```bash
# Install FVM (Flutter Version Management)
dart pub global activate fvm

# Install Melos (Monorepo management)
dart pub global activate melos
```

### 2. Setup Flutter Version

```bash
# Install Flutter 3.32.8 via FVM
fvm install 3.32.8

# Use Flutter 3.32.8 for this project
fvm use 3.32.8
```

### 3. Project Setup

```bash
# Clone the repository
git clone <repository-url>
cd base_flutter

# Generate environment configurations
make gen_env

# Bootstrap dependencies and generate code
make sync
```

### 4. Run the App

```bash
# Development environment
make run_dev

# QA environment  
make run_qa

# Staging environment
make run_stg

# Production environment
make run_prod
```

## 🛠️ Development Commands

### Build Runner (Code Generation)

✅ **Build runner is now working correctly!** Generate code for models, routes, and dependency injection:

```bash
# Generate code for all modules
make build_all

# Generate code for specific modules
make build_app      # App module only
make build_data     # Data module only
make build_domain   # Domain module only
make build_shared   # Shared module only

# Watch mode (auto-regenerate on file changes)
make watch_all      # Watch all modules
make watch_app      # Watch app module only
```

### Building and Running

```bash
# Development builds
make build_dev_apk        # Android APK
make build_dev_bundle     # Android App Bundle
make build_dev_ios        # iOS build
make build_dev_ipa        # iOS IPA

# Production builds
make build_prod_apk       # Production Android APK
make build_prod_bundle    # Production Android App Bundle
make build_prod_ipa       # Production iOS IPA
```

### Testing

```bash
# Run all tests
make test

# Run tests for specific modules
make test_app
make test_domain
make test_data
make test_shared
```

## 🏗️ Project Structure

```
base_flutter/
├── .fvm/
│   ├── fvm_config.json      # FVM configuration
│   └── flutter_sdk/         # Symlink to Flutter SDK
├── app/                     # Main Flutter application
├── data/                    # Data layer (repositories, APIs)
├── domain/                  # Domain layer (entities, use cases)
├── shared/                  # Shared utilities and widgets
├── resources/               # Localization resources
├── initializer/             # App initialization logic
├── tools/                   # Build and utility scripts
├── env/                     # Environment configurations
├── melos.yaml              # Melos configuration
└── makefile                # Build commands
```

## 🔧 FVM Integration

This project uses **FVM (Flutter Version Management)** to ensure consistent Flutter versions across the team:

- **Configuration**: `.fvm/fvm_config.json` specifies Flutter 3.32.8
- **VSCode Integration**: `.vscode/settings.json` points to `.fvm/flutter_sdk`
- **Local Setup**: Each developer's `local.properties` uses absolute paths
- **Team Consistency**: All developers use the same Flutter version automatically

### FVM Commands

```bash
# Check current Flutter version
fvm flutter --version

# List available Flutter versions
fvm releases

# Switch Flutter version (if needed)
fvm use <version>

# Install new Flutter version
fvm install <version>
```

## 🎨 Assets Generation

The project automatically generates Flutter assets using `flutter_gen`:

```bash
# Assets are generated automatically during sync
make sync

# Manual assets generation (if needed)
make gen_assets

# Update app icon
make update_app_icon

# Update splash screen
make update_splash
```

Generated assets are available at:
- `app/lib/resource/generated/assets.gen.dart`

Usage in code:
```dart
import 'package:app/resource/generated/assets.gen.dart';

// Use generated assets
Assets.images.yourImage.image()
Assets.fonts.yourFont
```

## 🔧 Troubleshooting

### FVM Issues

```bash
# If FVM not working, check installation
dart pub global activate fvm

# Check current Flutter version
fvm flutter --version

# Reinstall Flutter version
fvm install 3.32.8
fvm use 3.32.8
```

### Build Issues

```bash
# Clean and rebuild
make clean
make sync

# If build_runner fails
make build_manual

# Force clean and rebuild all modules
flutter clean
make sync
make build_all
```

### VSCode Issues

If VSCode doesn't detect the correct Flutter SDK:
1. Open Command Palette (`Cmd+Shift+P`)
2. Run "Flutter: Change SDK"
3. Select `.fvm/flutter_sdk` folder

## 📦 Upgrading Dependencies

### Upgrade Flutter Version

When upgrading Flutter, update these files:
- `README.md` (Requirements section)
- `.fvm/fvm_config.json`
- CI/CD pipeline files

### Upgrade Melos Version

When upgrading Melos, update:
- `README.md` (Requirements section)
- CI/CD pipeline files
- Global installation: `dart pub global activate melos <version>`

## License

MIT
# Test CI fixes
