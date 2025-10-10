import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'get_initial_app_data_use_case.freezed.dart';

@Injectable()
class GetInitialAppDataUseCase
    extends BaseSyncUseCase<GetInitialAppDataInput, GetInitialAppDataOutput> {
  const GetInitialAppDataUseCase(this._authRepository, this._settingsRepository);

  final AuthRepository _authRepository;
  final SettingsRepository _settingsRepository;

  @protected
  @override
  GetInitialAppDataOutput buildUseCase(GetInitialAppDataInput input) {
    return GetInitialAppDataOutput(
      isDarkMode: _settingsRepository.isDarkMode,
      isLoggedIn: _authRepository.isLoggedIn,
      languageCode: _settingsRepository.languageCode,
    );
  }
}

@freezed
abstract class GetInitialAppDataInput extends BaseInput with _$GetInitialAppDataInput {
  const GetInitialAppDataInput._();

  const factory GetInitialAppDataInput() = _GetInitialAppDataInput;
}

@freezed
abstract class GetInitialAppDataOutput extends BaseOutput with _$GetInitialAppDataOutput {
  const GetInitialAppDataOutput._();

  const factory GetInitialAppDataOutput({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isDarkMode,
    @Default(LanguageCode.ja) LanguageCode languageCode,
  }) = _GetInitialAppDataOutput;
}
