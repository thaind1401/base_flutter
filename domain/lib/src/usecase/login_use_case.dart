import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../domain.dart';

part 'login_use_case.freezed.dart';

@Injectable()
class LoginUseCase extends BaseFutureUseCase<LoginInput, LoginOutput> {
  const LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @protected
  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    if (!ValidationUtils.isValidEmail(input.email)) {
      throw const ValidationException(ValidationExceptionKind.invalidEmail);
    }

    if (!ValidationUtils.isValidPassword(input.password)) {
      throw const ValidationException(ValidationExceptionKind.invalidPassword);
    }

    await _authRepository.login(email: input.email, password: input.password);

    return const LoginOutput();
  }
}

@freezed
abstract class LoginInput extends BaseInput with _$LoginInput {
  const LoginInput._();

  const factory LoginInput({
    required String email,
    required String password,
  }) = _LoginInput;
}

@freezed
abstract class LoginOutput extends BaseOutput with _$LoginOutput {
  const LoginOutput._();

  const factory LoginOutput() = _LoginOutput;
}
