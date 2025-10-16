import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

part 'save_is_dark_mode_use_case.freezed.dart';

@Injectable()
class SaveIsDarkModeUseCase
    extends BaseFutureUseCase<SaveIsDarkModeInput, SaveIsDarkModeOutput> {
  SaveIsDarkModeUseCase(this._settingsRepository);

  final SettingsRepository _settingsRepository;

  @protected
  @override
  Future<SaveIsDarkModeOutput> buildUseCase(SaveIsDarkModeInput input) async {
    await _settingsRepository.saveIsDarkMode(input.isDarkMode);

    return const SaveIsDarkModeOutput();
  }
}

@freezed
abstract class SaveIsDarkModeInput extends BaseInput
    with _$SaveIsDarkModeInput {
  const SaveIsDarkModeInput._();

  const factory SaveIsDarkModeInput({
    required bool isDarkMode,
  }) = _SaveIsDarkModeInput;
}

@freezed
abstract class SaveIsDarkModeOutput extends BaseOutput
    with _$SaveIsDarkModeOutput {
  const SaveIsDarkModeOutput._();

  const factory SaveIsDarkModeOutput() = _SaveIsDarkModeOutput;
}
