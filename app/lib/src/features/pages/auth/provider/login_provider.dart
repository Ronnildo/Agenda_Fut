import 'package:flutter/foundation.dart';

class LoginProvider with ChangeNotifier, DiagnosticableTreeMixin {
  
  authUser(Map<String, dynamic> form, Function login){
    if (form.isEmpty){
      notifyListeners();
      return "Campos Inválidos, E-mail ou Senha não inseridos!";
    }else{
      notifyListeners();
      login();
    }
  }
}
