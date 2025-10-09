ifeq ($(OS),Windows_NT)
    BUILD_CMD=.\build_and_run_app.bat
    METRICS_CMD=.\tools\dart_code_metrics.bat
    COMMIT_CHECK_CMD=.\tools\check_commit_message.bat
else
    BUILD_CMD=./build_and_run_app.sh
    METRICS_CMD=./tools/dart_code_metrics.sh
    COMMIT_CHECK_CMD=./tools/check_commit_message.sh
endif

update_app_icon:
	cd app && flutter pub run flutter_launcher_icons:main -f app_icon/app-icon.yaml

update_splash:
	cd app && flutter pub run flutter_native_splash:create --path=splash/splash.yaml

remove_splash:
	cd app && flutter pub run flutter_native_splash:remove --path=splash/splash.yaml

l10n:
	@melos run l10n

test:
	@melos run test

test_app:
	@melos run test_app

test_domain:
	@melos run test_domain

test_data:
	@melos run test_data

test_shared:
	@melos run test_shared

clean:
	@melos clean

pub_get:
	@melos bootstrap

format:
	@melos run format

analyze:
	@melos run analyze

analyze_app:
	@melos run analyze_app

analyze_data:
	@melos run analyze_data

analyze_domain:
	@melos run analyze_domain

analyze_shared:
	@melos run analyze_shared

lint:
	@melos run lint

metrics:
	@melos run metrics

metrics_app:
	@melos run metrics_app

metrics_data:
	@melos run metrics_data

metrics_domain:
	@melos run metrics_domain

metrics_shared:
	@melos run metrics_shared

format_lint:
	@melos run format_lint

test_coverage:
	@melos run test_coverage

check_unused_files:
	@melos run check_unused_files

sync:
	@melos bootstrap
	@melos run l10n
	@echo "✅ Sync completed successfully. Build_runner available via 'make build_all'."

sync_with_build:
	@melos bootstrap
	@melos run l10n
	@melos run force_build_all

build_all:
	@echo "🚀 Running build_runner across all packages with modern dependencies..."
	@echo "📦 Using: build_runner 2.9.0, freezed 3.2.3, dart_style 3.1.2"
	@melos run build_all
	@echo ""
	@echo "✅ Working alternatives:"
	@echo "   1. Use manual builds: make build_manual"
	@echo "   2. Upgrade Flutter to 3.35.5+ (Dart 3.9.2+): 'fvm install stable'"
	@echo "   3. Use direct dart commands: 'cd app && dart run build_runner build'"
	@echo ""
	@echo "💡 To fix permanently:"
	@echo "   - Upgrade entire Flutter/Dart stack to latest stable"
	@echo "   - OR downgrade build_runner and related packages to older versions"
	@echo "   - OR create manual generated files (fallback approach)"
	@echo ""
	@echo "❌ Skipping build_runner execution due to package incompatibilities."

# Individual module builds (safer with FVM)
build_app:
	@echo "🔨 Building app module..."
	@melos run force_build_app || echo "❌ Build failed - try 'cd app && dart run build_runner build'"
	
build_domain:
	@echo "🔨 Building domain module..." 
	@melos run force_build_domain || echo "❌ Build failed - try 'cd domain && dart run build_runner build'"
	
build_data:
	@echo "🔨 Building data module..."
	@melos run force_build_data || echo "❌ Build failed - try 'cd data && dart run build_runner build'"
	
build_shared:
	@echo "🔨 Building shared module..."
	@melos run force_build_shared || echo "❌ Build failed - try 'cd shared && dart run build_runner build'"
# Force build all modules with updated compatible versions
force_build_all:
	@melos run force_build_all

# Build with system Flutter (recommended workaround)
build_system:
	@./tools/build_with_system_flutter.sh

# Manual build without FVM/melos (alternative approach)
build_manual:
	@./tools/manual_build.sh

# Test new melos syntax with updated commands
test_new_build:
	@echo "🧪 Testing updated Melos 6.3.0 build commands..."
	@melos run force_build_data || echo "❌ Still fails with FVM - use manual build instead"
force_build_app:
	@melos run force_build_app
force_build_domain:
	@melos run force_build_domain
force_build_data:
	@melos run force_build_data
force_build_shared:
	@melos run force_build_shared
watch_all:
	@melos run watch_all
watch_app:
	@melos run watch_app
watch_domain:
	@melos run watch_domain
watch_data:
	@melos run watch_data
watch_shared:
	@melos run watch_shared
force_watch_all:
	@melos run force_watch_all
force_watch_app:
	@melos run force_watch_app
force_watch_domain:
	@melos run force_watch_domain
force_watch_data:
	@melos run force_watch_data
force_watch_shared:
	@melos run force_watch_shared

run_dev:
	cd tools && $(BUILD_CMD) develop run

run_qa:
	cd tools && $(BUILD_CMD) qa run

run_stg:
	cd tools && $(BUILD_CMD) staging run
	
run_prod:
	cd tools && $(BUILD_CMD) production run

build_dev_apk:
	cd tools && $(BUILD_CMD) develop build apk

build_qa_apk:
	cd tools && $(BUILD_CMD) qa build apk

build_stg_apk:
	cd tools && $(BUILD_CMD) staging build apk

build_prod_apk:
	cd tools && $(BUILD_CMD) production build apk

build_dev_bundle:
	cd tools && $(BUILD_CMD) develop build appbundle

build_qa_bundle:
	cd tools && $(BUILD_CMD) qa build appbundle

build_stg_bundle:
	cd tools && $(BUILD_CMD) staging build appbundle

build_prod_bundle:
	cd tools && $(BUILD_CMD) production build appbundle

build_dev_ios:
	cd tools && $(BUILD_CMD) develop build ios

build_qa_ios:
	cd tools && $(BUILD_CMD) qa build ios

build_stg_ios:
	cd tools && $(BUILD_CMD) staging build ios

build_prod_ios:
	cd tools && $(BUILD_CMD) production build ios

build_dev_ipa:
	cd tools && $(BUILD_CMD) develop build ipa --export-options-plist=ios/exportOptions.plist

build_qa_ipa:
	cd tools && $(BUILD_CMD) qa build ipa --export-options-plist=ios/exportOptions.plist

build_stg_ipa:
	cd tools && $(BUILD_CMD) staging build ipa --export-options-plist=ios/exportOptions.plist

build_prod_ipa:
	cd tools && $(BUILD_CMD) production build ipa --export-options-plist=ios/exportOptions.plist

pub_get_data:
	@melos run pub_get_data
pub_get_domain:
	@melos run pub_get_domain
pub_get_app:
	@melos run pub_get_app
pub_get_shared:
	@melos run pub_get_shared

dart_code_metrics:
	$(METRICS_CMD)

check_commit_message:
	$(COMMIT_CHECK_CMD) "$(shell git log --format=%B -n 1 --no-merges $(BITBUCKET_COMMIT))"

gen_env:
	dart pub get --directory=tools/gen_env
	dart run tools/gen_env/lib/main.dart

pub_upgrade:
	melos pub_upgrade
	
pub_sync:
	cd tools && ./sync_all_pub_versions.sh
	melos bootstrap

dart_fix:
	dart fix --apply
