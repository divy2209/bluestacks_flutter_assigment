import 'package:bluestacks_flutter_assigment/services/login/credentials.dart';

class LoginService {

  String? credentialsValidation({required user, required pass}) {
    if(user.length<3 || user.length>10) {
      return 'Invalid Username, length should be 3-10!';
    } else if(pass.length<3 || pass.length>10) {
      return 'Invalid Password, length should be 3-10!';
    } else {
      return null;
    }
  }
  String? login({required user, required pass}) {
    if(loginDetails.containsKey(user)){
      if(loginDetails[user] == pass) {
        return null;
      } else {
        return 'Incorrect Password!';
      }
    } else {
      return 'User not registered!';
    }
  }
}