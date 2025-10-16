import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:resources/resources.dart';
import 'package:shared/shared.dart';

import '../../../domain.dart';

part 'fake_login_use_case.freezed.dart';

@Injectable()
class FakeLoginUseCase
    extends BaseFutureUseCase<FakeLoginInput, FakeLoginOutput> {
  const FakeLoginUseCase(this._navigator, this._authRepository);

  final AppNavigator _navigator;
  final AuthRepository _authRepository;

  @protected
  @override
  Future<FakeLoginOutput> buildUseCase(FakeLoginInput input) async {
    await _navigator.showDialog(
      AppPopupInfo.confirmDialog(
          message: S.current.login,
          onPressed: Func0(() async {
            await _authRepository.saveAccessToken('fakeToken');
            await _navigator.replace(const AppRouteInfo.main());
          })),
      useRootNavigator: true,
    );

    return const FakeLoginOutput();
  }
}

@freezed
abstract class FakeLoginInput extends BaseInput with _$FakeLoginInput {
  const FakeLoginInput._();

  const factory FakeLoginInput() = _FakeLoginInput;
}

@freezed
abstract class FakeLoginOutput extends BaseOutput with _$FakeLoginOutput {
  const FakeLoginOutput._();

  const factory FakeLoginOutput() = _FakeLoginOutput;
}
