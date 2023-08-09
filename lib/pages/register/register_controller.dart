import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/common/widgets/toast.dart';
import 'package:ulearing/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (userName.isEmpty) {
      toastInfo(message: "user name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(message: "email can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: "password can not be empty");
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(message: "confirm password can not be empty");
      return;
    }
    if (password != confirmPassword) {
      toastInfo(message: "password and confirm password must be same");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential?.user == null) {
        toastInfo(message: "user does not exist");
        return;
      }
      await credential.user?.sendEmailVerification();
      await credential.user?.updateDisplayName(userName);
      toastInfo(
          message:
              "an email has been sent to your email address, please verify your email");
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: "password is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: "email is already in use");
      } else {
        toastInfo(message: "error on register");
      }
    }
  }
}
