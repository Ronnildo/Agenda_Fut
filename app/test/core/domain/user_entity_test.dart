import 'package:app/src/core/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Usuário não deve ser nulo", (){
    UserEntity userEntity = UserEntity(name: "Ronnildo", email: "ronnildo@teste.com", password: "122342");

    expect(userEntity, isNotNull);
  });

  test("Usuário preencheu os campos necessários", (){
    UserEntity userEntity = UserEntity(name: "Ronnildo", email: "ronnildo@teste.com", password: "122342");

    final result = true;

    expect(userEntity.containsRequirements(), result);
  });

  test("A senha do meu usuário deve conter pelo menos 6 digitos", (){
    UserEntity userEntity = UserEntity(name: "Ronnildo", email: "ronnildo@teste.com", password: "122342");

    final result = true;

    expect(userEntity.isValidPassword(), result);
  });

  test("A senha do meu usuário não contém 6 digitos", (){
    UserEntity userEntity = UserEntity(name: "Ronnildo", email: "ronnildo@teste.com", password: "1223");

    final result = false;

    expect(userEntity.isValidPassword(), result);
  });

  test("O email do usuário deve conter @ e ter um servidor de email válido", (){
    UserEntity userEntity = UserEntity(name: "Ronnildo", email: "ronnildo@gmail.com", password: "122342");

    final result = true;

    expect(userEntity.isValidEmail(), result);
  });

  test("O email do usuário não contém @ e um servidor de email válido", (){
    UserEntity userEntity = UserEntity(name: "Ronnildo", email: "ronnildo@teste.com", password: "122342");

    final result = false;

    expect(userEntity.isValidEmail(), result);
  });
}