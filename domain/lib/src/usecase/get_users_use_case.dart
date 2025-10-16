import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../domain.dart';

part 'get_users_use_case.freezed.dart';

@Injectable()
class GetUsersUseCase extends BaseLoadMoreUseCase<GetUsersInput, User> {
  GetUsersUseCase(this._userRepository)
      : super(initPage: PagingConstants.initialPage);

  final UserRepository _userRepository;

  @protected
  @override
  Future<PagedList<User>> buildUseCase(GetUsersInput input) {
    return _userRepository.getUsers(
      page: page,
      limit: PagingConstants.itemsPerPage,
    );
  }
}

@freezed
abstract class GetUsersInput extends BaseInput with _$GetUsersInput {
  const GetUsersInput._();

  const factory GetUsersInput() = _GetUsersInput;
}
