import 'package:email_auth_test/LoginScreen.dart';
import 'package:email_auth_test/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _user;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, _MainScreenSetting);
  }

  _MainScreenSetting(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => MainScreen());
    }
  }

  void SignOut() async {
    await auth.signOut();
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error", "Enter all feilds",
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.TOP);
    }
  }

  void register(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar("Error", "Enter all feilds");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.TOP);
    }
  }
}
