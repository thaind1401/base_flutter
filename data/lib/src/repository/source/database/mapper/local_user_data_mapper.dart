import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../../../data.dart';

@Injectable()
class LocalUserDataMapper extends BaseDataMapper<LocalUserData, User>
    with DataMapperMixin {
  LocalUserDataMapper(
    this._genderDataMapper,
    this._localImageUrlDataMapper,
  );

  final GenderDataMapper _genderDataMapper;
  final LocalImageUrlDataMapper _localImageUrlDataMapper;

  @override
  User mapToEntity(LocalUserData? data) {
    return User(
      id: data?.id ?? User.defaultId,
      email: data?.email ?? User.defaultEmail,
      money: BigDecimal.tryParse(data?.money) ?? User.defaultMoney,
      birthday: data?.birthday != null
          ? DateTime.fromMillisecondsSinceEpoch(data!.birthday!)
          : User.defaultBirthday,
      // Temporarily return default values due to ObjectBox relations being commented out
      avatar: _localImageUrlDataMapper.mapToEntity(null),
      photos: _localImageUrlDataMapper.mapToListEntity(<LocalImageUrlData>[]),
      gender: _genderDataMapper.mapToEntity(data?.gender),
    );
  }

  @override
  LocalUserData mapToData(User entity) {
    return LocalUserData(
      email: entity.email,
      money: entity.money.toString(),
      birthday: entity.birthday?.millisecondsSinceEpoch,
      gender: _genderDataMapper.mapToData(entity.gender),
    );
    // Temporarily commented out ObjectBox relations due to version issues
    // ..avatar.target = _localImageUrlDataMapper.mapToData(entity.avatar)
    // ..photos.addAll(_localImageUrlDataMapper.mapToListData(entity.photos));
  }
}
