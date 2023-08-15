import 'package:get/get.dart';
import '../repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<void> singIn({
    required String email,
    required String password,
  }) async {

    isLoading.value = true;

    await authRepository.signIn(email: 'guilherme@gmail.com', password: 'gui123456');

    isLoading.value = false;
  }
}
