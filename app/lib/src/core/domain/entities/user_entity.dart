// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  String name;
  String email;
  String password;
  String? cellPhone;
  String? position;
  String? photo;

  UserEntity({
    required this.name,
    required this.email,
    required this.password,
    this.cellPhone,
    this.position,
    this.photo,
  });

  bool isValidPassword() {
    if (password.length >= 6) {
      return true;
    }

    return false;
  }

  bool isValidEmail() {
    if (email.contains("@") &&
        (email.contains("gmail.com") ||
            email.contains("hotmail.com") ||
            email.contains("outlook.com"))) {
      return true;
    }
    return false;
  }

  bool containsRequirements(){
    if(email.isNotEmpty && password.isNotEmpty && name.isNotEmpty){
      return true;
    }
    return false;
  }
}
