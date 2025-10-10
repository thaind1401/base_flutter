import 'package:injectable/injectable.dart';
// Temporarily commented out ObjectBox imports due to version issues
// import 'package:objectbox/objectbox.dart';

import '../../../../data.dart';

@LazySingleton()
class AppDatabase {
  // Temporarily disabled ObjectBox functionality due to version issues
  // AppDatabase(this.store);
  AppDatabase();

  // final Store store;

  int putUser(LocalUserData user) {
    // Temporarily return dummy value instead of using ObjectBox
    // return store.box<LocalUserData>().put(user);
    return 0;
  }

  Stream<List<LocalUserData>> getUsersStream() {
    // Temporarily return empty stream instead of using ObjectBox
    // return store
    //     .box<LocalUserData>()
    //     .query()
    //     .watch(triggerImmediately: true)
    //     .map((query) => query.find());
    return Stream.value(<LocalUserData>[]);
  }

  List<LocalUserData> getUsers() {
    // Temporarily return empty list instead of using ObjectBox
    // return store.box<LocalUserData>().getAll();
    return <LocalUserData>[];
  }

  LocalUserData? getUser(int id) {
    // Temporarily return null instead of using ObjectBox
    // return store.box<LocalUserData>().get(id);
    return null;
  }

  bool deleteImageUrl(int id) {
    // Temporarily return false instead of using ObjectBox
    // return store.box<LocalImageUrlData>().remove(id);
    return false;
  }

  int deleteAllUsersAndImageUrls() {
    // Temporarily return 0 instead of using ObjectBox
    // store.box<LocalImageUrlData>().removeAll();
    // return store.box<LocalUserData>().removeAll();
    return 0;
  }
}
