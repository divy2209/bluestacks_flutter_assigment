class Validation {

  String? loginValidation({required user, required pass}) {
    if(user.length<3 || user.length>10) {
      return 'Invalid Username, length should be 3-10!';
    } else if(pass.length<3 || pass.length>10) {
      return 'Invalid Password, length should be 3-10!';
    } else {
      return null;
    }
  }
  String? login({required user, required pass}) {
    if(user == '9898989898') {
      if(pass == 'pass'){
        return null;
      } else {
        return 'Incorrect Password!';
      }
    } else if(user == '9876543210') {
      if(pass == 'password'){
        return null;
      } else {
        return 'Incorrect Password!';
      }
    } else {
      return 'User not registered!';
    }
  }
}