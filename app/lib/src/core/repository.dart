import 'package:app/src/models/user_model.dart';

abstract class Repository<T>{
  Future<T> adduser(UserModel user);
}