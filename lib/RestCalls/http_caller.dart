import 'package:http/http.dart' as http;

class HttpCaller {
  static const String _baseUrl = "https://foodster-cs491.herokuapp.com";

  static bool signUp(String email, String password){
    http.post(
      _baseUrl + '/users/signup',
      body: {
        email: email,
        password: password
      }
    ).then((http.Response response) {
      print(response;
    },
      onError: (e){
        print(e);
      }
    );
  }
}