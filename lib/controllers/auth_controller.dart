import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<User?> _user = Rx<User?>(null);

  Stream<User?> get user => _user.stream;

  void loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _user.value = userCredential.user;
      Get.offNamed('/home'); // Navigate to home after successful login
    } catch (e) {
      // Handle authentication errors
    }
  }

  void logout() async {
    await _auth.signOut();
    _user.value = null;
    Get.offAllNamed('/login'); // Navigate to login after logout
  }

// Similar methods for other authentication providers (Google, Facebook, etc.)
}
