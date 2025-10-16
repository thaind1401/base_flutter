import '../../../domain.dart';
import '../base/base_repository.dart';

abstract interface class UserRepository extends BaseRepository {
  /// Gets current user profile from server
  Future<User> getMe();

  /// Gets paginated list of users from server
  Future<PagedList<User>> getUsers({
    required int page,
    required int? limit,
  });

  /// Saves user to local database
  /// Returns the database ID of the saved user
  int putLocalUser(User user);

  /// Gets all users from local database
  List<User> getLocalUsers();

  /// Returns a stream of users from local database
  /// Updates when local data changes
  Stream<List<User>> getLocalUsersStream();

  /// Gets specific user from local database by ID
  /// Returns null if user not found
  User? getLocalUser(int id);

  /// Deletes image URL by ID from local database
  /// Returns true if deletion was successful
  bool deleteImageUrl(int id);

  /// Deletes all users and image URLs from local database
  /// Returns the number of deleted records
  int deleteAllUsersAndImageUrls();
}