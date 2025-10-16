import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

part 'clear_current_user_data_use_case.freezed.dart';

@Injectable()
class ClearCurrentUserDataUseCase extends BaseFutureUseCase<
    ClearCurrentUserDataInput, ClearCurrentUserDataOutput> {
  const ClearCurrentUserDataUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @protected
  @override
  Future<ClearCurrentUserDataOutput> buildUseCase(
    ClearCurrentUserDataInput input,
  ) async {
    await _authRepository.clearCurrentUserData();

    return const ClearCurrentUserDataOutput();
  }
}

@freezed
abstract class ClearCurrentUserDataInput extends BaseInput
    with _$ClearCurrentUserDataInput {
  const ClearCurrentUserDataInput._();

  const factory ClearCurrentUserDataInput() = _ClearCurrentUserDataInput;
}

@freezed
abstract class ClearCurrentUserDataOutput extends BaseOutput
    with _$ClearCurrentUserDataOutput {
  const ClearCurrentUserDataOutput._();

  const factory ClearCurrentUserDataOutput() = _ClearCurrentUserDataOutput;
}
