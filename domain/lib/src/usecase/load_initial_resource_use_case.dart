import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

part 'load_initial_resource_use_case.freezed.dart';

@Injectable()
class LoadInitialResourceUseCase extends BaseFutureUseCase<
    LoadInitialResourceInput, LoadInitialResourceOutput> {
  const LoadInitialResourceUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @protected
  @override
  Future<LoadInitialResourceOutput> buildUseCase(
      LoadInitialResourceInput input) async {
    final isLoggedIn = await _authRepository.isLoggedIn;
    final initialRoutes = [
      isLoggedIn ? InitialAppRoute.main : InitialAppRoute.login
    ];

    return LoadInitialResourceOutput(initialRoutes: initialRoutes);
  }
}

@freezed
abstract class LoadInitialResourceInput extends BaseInput
    with _$LoadInitialResourceInput {
  const LoadInitialResourceInput._();

  const factory LoadInitialResourceInput() = _LoadInitialResourceInput;
}

@freezed
abstract class LoadInitialResourceOutput extends BaseOutput
    with _$LoadInitialResourceOutput {
  const LoadInitialResourceOutput._();

  const factory LoadInitialResourceOutput({
    @Default([InitialAppRoute.main]) List<InitialAppRoute> initialRoutes,
  }) = _LoadInitialResourceOutput;
}
