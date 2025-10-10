import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

part 'is_logged_in_use_case.freezed.dart';

@Injectable()
class IsLoggedInUseCase extends BaseFutureUseCase<IsLoggedInInput, IsLoggedInOutput> {
  const IsLoggedInUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @protected
  @override
  Future<IsLoggedInOutput> buildUseCase(IsLoggedInInput input) async {
    final isLoggedIn = await _authRepository.isLoggedIn;
    return IsLoggedInOutput(isLoggedIn: isLoggedIn);
  }
}

@freezed
abstract class IsLoggedInInput extends BaseInput with _$IsLoggedInInput {
  const IsLoggedInInput._();

  const factory IsLoggedInInput() = _IsLoggedInInput;
}

@freezed
abstract class IsLoggedInOutput extends BaseOutput with _$IsLoggedInOutput {
  const IsLoggedInOutput._();

  const factory IsLoggedInOutput({
    @Default(false) bool isLoggedIn,
  }) = _IsLoggedInOutput;
}
