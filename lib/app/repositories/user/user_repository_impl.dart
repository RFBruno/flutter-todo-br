// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_br/app/exception/auth_exception.dart';

import 'package:flutter_todo_br/app/repositories/user/user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredencial.user;
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);

      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);

        if (loginTypes.contains('password')) {
          throw AuthException(
              message: 'E-mail já utilizado, por favor escolha outro e-mail.');
        } else {
          throw AuthException(
              message:
                  'Você se cadastrou no Todo List pelo Google, por favor utilize ele para entra!');
        }
      } else {
        throw AuthException(message: 'Erro ao registrar usuario');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      var userCredencial = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredencial.user;
    } on PlatformException catch (e, s) {
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'too-many-requests') {
        throw AuthException(message: 'Tente novamente mais tarde');
      }
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        throw AuthException(message: 'E-mail ou Senha inválido');
      }
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else if (loginMethods.contains('google')) {
        throw AuthException(
            message:
                'Cadastro realizado com o google não pode ser resetado a senha');
      } else {
        throw AuthException(message: 'E-mail não cadastrado');
      }
    } on PlatformException catch (e) {
      throw AuthException(message: 'Erro ao resetar senha');
    }
  }

  @override
  Future<User?> googleLogin() async {
    List<String>? loginMethods;
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        loginMethods =
            await _firebaseAuth.fetchSignInMethodsForEmail(googleUser.email);

        if (loginMethods.contains('password')) {
          throw AuthException(
              message:
                  'Você utilizou o e-mail para cadastro no TodoList, caso tenha esquecido a senha clique em esqueci senha');
        } else {
          final googleAuth = await googleUser.authentication;
          final firebaseCredencial = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          var userCredencial =
              await _firebaseAuth.signInWithCredential(firebaseCredencial);
          return userCredencial.user;
        }
      }
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'account-exists-with-different-credential') {
        throw AuthException(message: '''
          Login inválido você se registrou no TodoList com os seguintes provedores:
          ${loginMethods?.join(',')}
        ''');
      }else{
        throw AuthException(message: 'Erro ao realizar login');
      }
    }
  }
  
  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    _firebaseAuth.signOut();
  }
  
  @override
  Future<void> updateDisplayName(String name) async {
    final user = _firebaseAuth.currentUser;
    if(user != null){
      await user.updateDisplayName(name);
      user.reload();
    }
  }
}
