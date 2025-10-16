import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../data.dart';

@LazySingleton(as: UserRepository)
final class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
    this._appApiService,
    this._appDatabase,
    this._userDataMapper,
    this._localUserDataMapper,
    this._connectivityService,
  );

  final AppApiService _appApiService;
  final AppDatabase _appDatabase;
  final ApiUserDataMapper _userDataMapper;
  final LocalUserDataMapper _localUserDataMapper;
  final ConnectivityServiceInterface _connectivityService;

  // BaseRepository implementations
  @override
  String get repositoryName => 'UserRepository';

  @override
  Future<bool> get isConnected => _connectivityService.isConnected;

  @override
  Stream<bool> get onConnectivityChanged =>
      _connectivityService.onConnectivityChanged;

  @override
  Future<void> clearCache() async {
    _appDatabase.deleteAllUsersAndImageUrls();
  }

  // UserRepository specific implementations
  @override
  Future<User> getMe() async {
    final response = await _appApiService.getMe();
    return _userDataMapper.mapToEntity(response);
  }

  @override
  Future<PagedList<User>> getUsers({
    required int page,
    required int? limit,
  }) async {
    final response = await _appApiService.getUsers(page: page, limit: limit);
    return PagedList(data: _userDataMapper.mapToListEntity(response?.results));
  }

  @override
  int putLocalUser(User user) {
    final userData = _localUserDataMapper.mapToData(user);
    return _appDatabase.putUser(userData);
  }

  @override
  List<User> getLocalUsers() {
    return _localUserDataMapper.mapToListEntity(_appDatabase.getUsers());
  }

  @override
  Stream<List<User>> getLocalUsersStream() {
    return _appDatabase
        .getUsersStream()
        .map((event) => _localUserDataMapper.mapToListEntity(event));
  }

  @override
  User? getLocalUser(int id) {
    return _localUserDataMapper.mapToEntity(_appDatabase.getUser(id));
  }

  @override
  bool deleteImageUrl(int id) {
    return _appDatabase.deleteImageUrl(id);
  }

  @override
  int deleteAllUsersAndImageUrls() {
    return _appDatabase.deleteAllUsersAndImageUrls();
  }
}
