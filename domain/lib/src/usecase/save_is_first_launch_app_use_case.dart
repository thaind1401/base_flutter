import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

part 'save_is_first_launch_app_use_case.freezed.dart';

@Injectable()
class SaveIsFirstLaunchAppUseCase extends BaseFutureUseCase<
    SaveIsFirstLaunchAppInput, SaveIsFirstLaunchAppOutput> {
  SaveIsFirstLaunchAppUseCase(this._settingsRepository);

  final SettingsRepository _settingsRepository;

  @protected
  @override
  Future<SaveIsFirstLaunchAppOutput> buildUseCase(
      SaveIsFirstLaunchAppInput input) async {
    await _settingsRepository.saveIsFirstLaunchApp(input.isFirstLaunchApp);

    return const SaveIsFirstLaunchAppOutput();
  }
}

@freezed
abstract class SaveIsFirstLaunchAppInput extends BaseInput
    with _$SaveIsFirstLaunchAppInput {
  const SaveIsFirstLaunchAppInput._();

  const factory SaveIsFirstLaunchAppInput({
    required bool isFirstLaunchApp,
  }) = _SaveIsFirstLaunchAppInput;
}

@freezed
abstract class SaveIsFirstLaunchAppOutput extends BaseOutput
    with _$SaveIsFirstLaunchAppOutput {
  const SaveIsFirstLaunchAppOutput._();

  const factory SaveIsFirstLaunchAppOutput() = _SaveIsFirstLaunchAppOutput;
}
