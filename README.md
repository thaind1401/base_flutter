
### Requirements

- Dart: 3.8.1
- Flutter SDK: 3.32.8
- Melos: 6.3.0
- CocoaPods: 1.12.0

### Install

- WARN: If you already installed `melos` and `lefthook`, you could omit this step.

- Install melos:
    - Run `dart pub global activate melos 6.3.3`

- Install lefthook (optional):
    - Run `gem install lefthook`

- Export paths:
    - Add to `.zshrc` or `.bashrc` file
```    
export PATH="$PATH:<path to flutter>/flutter/bin"
export PATH="$PATH:<path to flutter>/flutter/bin/cache/dart-sdk/bin"
export PATH="$PATH:~/.pub-cache/bin"
export PATH="$PATH:~/.gem/gems/lefthook-0.7.7/bin"
```
    - Save file `.zshrc`
    - Run `source ~/.zshrc`

### Config and run app

- cd to root folder of project
- Run `make gen_env`
- Run `make sync`
- Run `lefthook install` (optional)
- Run & Enjoy!

### Build Runner (Code Generation)

**⚠️ CRITICAL: Multiple Package Compatibility Issues**

Build runner is currently **incompatible** with this setup due to multiple version conflicts.

#### � **Issues Identified:**
1. **dart_style API mismatch**: `DartFormatter(languageVersion: ...)` not found in 2.3.x
2. **analyzer version conflicts**: Missing methods in 6.2.0 vs build_resolvers 2.4.4  
3. **Dart SDK requirements**: Current 3.6.2 vs required >=3.7.0 for newer packages
4. **FVM SocketException**: frontend_server communication failures

#### ✅ **Working Solutions:**

1. **Upgrade Flutter/Dart (Recommended)**:
   ```bash
   fvm install stable          # Install Flutter 3.35.5+ (Dart 3.9.2+)
   fvm use stable             # Switch to latest stable
   melos bootstrap            # Rebuild dependencies
   ```

2. **Manual Build Script (Current Fallback)**:
   ```bash
   make build_manual          # Uses manual approach, bypasses FVM
   ```

3. **Direct Commands (Individual modules)**:
   ```bash
   cd app && dart run build_runner build --delete-conflicting-outputs
   cd ../data && dart run build_runner build --delete-conflicting-outputs
   # Note: These will fail with current package versions
   ```

#### 🚫 **Currently Failing Commands:**
- `make build_all` → Shows diagnostic information
- `melos run force_build_app` → Multiple compatibility errors
- `make sync_with_build` → Will fail at build step

#### 💡 **Permanent Fix Options:**
1. **Upgrade Stack**: Flutter 3.35.5+ + Dart 3.9.2+ + compatible package versions
2. **Downgrade Packages**: Revert build_runner/analyzer to older compatible versions  
3. **Manual Generation**: Create required generated files manually (emergency fallback)

### Known Issues

- **Package Version Hell**: dart_style, analyzer, build_runner, build_resolvers all have incompatible version requirements
- **FVM Limitations**: SocketException persists across multiple approaches
- **Status**: **Requires Flutter/Dart upgrade** OR **manual package version management**

## Upgrade Flutter
- Update Flutter version in:
    - [README.md](#requirements)
    - [bitbucket-pipelines.yml](bitbucket-pipelines.yml)
    - [ci.yaml](.github/workflows/ci.yaml)
    - [cd_develop.yaml](.github/workflows/cd_develop.yaml)
    - [cd_qa.yaml](.github/workflows/cd_qa.yaml)
    - [cd_staging.yaml](.github/workflows/cd_staging.yaml)
    - [cd_production.yaml](.github/workflows/cd_production.yaml)

## Upgrade Melos
- Update Melos version in:
    - [README.md](#requirements)
    - [Install](#install)
    - [bitbucket-pipelines.yml](bitbucket-pipelines.yml)
    - [ci.yaml](.github/workflows/ci.yaml)
    - [cd_develop.yaml](.github/workflows/cd_develop.yaml)
    - [cd_qa.yaml](.github/workflows/cd_qa.yaml)
    - [cd_staging.yaml](.github/workflows/cd_staging.yaml)
    - [cd_production.yaml](.github/workflows/cd_production.yaml)

## License

MIT
