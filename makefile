ifeq ($(OS),Windows_NT)
    BUILD_CMD=.\build_and_run_app.bat
    COMMIT_CHECK_CMD=.\tools\check_commit_message.bat
else
    BUILD_CMD=./build_and_run_app.sh
    COMMIT_CHECK_CMD=./tools/check_commit_message.sh
endif

update_app_icon:
	cd app && flutter pub run flutter_launcher_icons:main -f app_icon/app-icon.yaml

update_splash:
	cd app && flutter pub run flutter_native_splash:create --path=splash/splash.yaml

remove_splash:
	cd app && flutter pub run flutter_native_splash:remove --path=splash/splash.yaml

gen_assets:
	cd app && dart run build_runner build --delete-conflicting-outputs

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

bootstrap:
	@melos bootstrap

sync:
	@melos bootstrap
	@melos run l10n
	@make gen_assets
	@echo "✅ Sync completed successfully. Assets generated. Build_runner available via 'make build_all'."

sync_with_build:
	@melos bootstrap
	@melos run l10n
	@melos run force_build_all

build_all:
	@echo "🚀 Running build_runner across all packages in dependency order..."
	@echo "📦 Using: build_runner 2.7.1, freezed 3.2.3, dart_style 3.1.2"
	@echo ""
	@echo "🔄 Building modules in order: shared → domain → data → app"
	@echo ""
	@echo "1️⃣ Building shared module..."
	@melos run build_shared
	@echo "2️⃣ Building domain module..."
	@melos run build_domain
	@echo "3️⃣ Building data module..."
	@melos run build_data
	@echo "4️⃣ Building app module..."
	@melos run build_app
	@echo ""
	@echo "✅ All modules built successfully!"
	@echo ""
	@echo "💡 Available build commands:"
	@echo "   - make build_all: Build all modules in order"
	@echo "   - make build_shared: Build shared module only"
	@echo "   - make build_domain: Build domain module only"
	@echo "   - make build_data: Build data module only"
	@echo "   - make build_app: Build app module only"
	@echo ""
	@echo "🔧 Alternative build methods:"
	@echo "   - make build_manual: Manual build without melos"
	@echo "   - make build_system: Build with system Flutter"

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

check_commit_message:
	$(COMMIT_CHECK_CMD) "$(shell git log --format=%B -n 1 --no-merges $(BITBUCKET_COMMIT))"

gen_env:
	dart pub get --directory=tools/gen_env
	dart run tools/gen_env/lib/main.dart

setup_android:
	@bash ./tools/setup_android_local.sh

pub_upgrade:
	melos pub_upgrade
	
pub_sync:
	cd tools && ./sync_all_pub_versions.sh
	melos bootstrap

dart_fix:
	dart fix --apply

# Code formatting
format:
	@echo "🎨 Formatting code..."
	@melos run format

format_check:
	@echo "🎨 Checking code formatting..."
	@melos run format_check

# Static analysis commands
analyze_app:
	@echo "🔍 Analyzing app module..."
	@melos run analyze_app

analyze_data:
	@echo "🔍 Analyzing data module..."
	@melos run analyze_data

analyze_domain:
	@echo "🔍 Analyzing domain module..."
	@melos run analyze_domain

analyze_shared:
	@echo "🔍 Analyzing shared module..."
	@melos run analyze_shared

# Code metrics
dart_code_metrics:
	@echo "📊 Running code metrics..."
	@bash ./tools/dart_code_metrics.sh

# Test coverage
test_coverage:
	@echo "📈 Running test coverage..."
	@melos run test_coverage
