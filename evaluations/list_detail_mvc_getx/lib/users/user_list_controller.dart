import 'package:get/get.dart';
import 'package:list_detail_mvc_getx/users/user.dart';
import 'package:list_detail_mvc_getx/users/user_repository.dart';

/// This is the controller (the C in MVC). It acts as an intermediary between
/// your views (the UI) and your model (the data and its business logic).
///
/// It lets the UI code only deal with UI, and not with things like
/// requesting new data, caching or notifying other parts of the app about
/// changes.
class UserController extends GetxController {
  final UserRepository _userRepository = Get.find<UserRepository>();

  final RxBool _loading = false.obs;

  final RxList<User> _users = <User>[].obs;

  /// The users in memory. The controller is responsible of keeping these
  /// in sync with the users in [repository].
  List<User> get users => _users;

  bool get loading => _loading.value;

  onInit() {
    super.onInit();
    loadUsers();
  }

  loadUsers() async {
    _loading.value = true;

    try {
      _users(await _userRepository.fetchUsers());
    } catch (e) {
      // It is almost always important the user knows about failures like these.
      // For simplicity, we're not doing it here, but in a real app, the
      // controller would deal with this.
      _users(<User>[]);
    } finally {
      _loading.value = false;
    }
  }

  addUser(User user) {
    _users.add(user);
    _userRepository.addUser(user);
  }
}
