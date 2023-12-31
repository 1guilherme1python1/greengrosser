import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

print(result);
    if(result['result'] != null){
      print('sing in funcionou');
    } else {
      print('singin nao funcionou');
      print(result['error']);
    }
    // return result;
  }
}
