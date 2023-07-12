// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo_br/app/exception/auth_exception.dart';

import 'package:flutter_todo_br/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }): _firebaseAuth = firebaseAuth;
  
  @override
  Future<User?> register(String email, String password) async {
    try {
  final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  return userCredencial.user;
} on FirebaseAuthException catch (e, s) {
  print(e);
  print(s);

  if (e.code == 'email-already-in-use') {
    final loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);

    if(loginTypes.contains('password')){
      throw AuthException(message: 'E-mail já utilizado, por favor escolha outro e-mail.');
    }else{
      throw AuthException(message: 'Você se cadastrou no Todo List pelo Google, por favor utilize ele para entra!');
    }
  }else{
    throw AuthException(message: 'Erro ao registrar usuario');
  }
}
  }

}
