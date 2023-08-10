import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearing/common/apis/user_api.dart';
import 'package:ulearing/common/entities/entities.dart';
import 'package:ulearing/common/widgets/toast.dart';
import 'package:ulearing/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(String type) async {
    print(type);
    try {
      if (type == "email") {
        //Blockprovider.of<SignInBloc>(context).state);
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          // form validation
          toastInfo(message: "your need to fill your email address");
          return;
        }
        if (password.isEmpty) {
          //form validation
          toastInfo(message: "your need to fill your password");
          return;
        }

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential?.user == null) {
            //check if user is null
            toastInfo(message: "your user does not exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            //check if email is verified
            toastInfo(message: "your email is not verified");
            return;
          }
          var user = credential.user;
          if (user != null) {
            //success login firebase
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            print("success login");
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.name = displayName;
            loginRequestEntity.type = 1;
            asyncPostAllData(loginRequestEntity);
            toastInfo(message: "success login");
            // GlobalPreferences.storageService
            //     .setString(AppsConsts.STORAGE_USER_TOKEN_KEY, "123");
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //error on login from firebase
            toastInfo(message: "error on login");
          }
        } on FirebaseAuthException catch (e) {
          print(e);
          if (e.code == 'user-not-found') {
            //user not found
            print("no user found that email");
            toastInfo(message: "no user found that email");
          } else if (e.code == 'wrong-password') {
            //wrong password
            print("wrong password provided for that user.");
            toastInfo(message: "wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            //invalid email
            print("invalid email");
            toastInfo(message: "invalid email");
          } else {
            //other error
            print("other error");
            toastInfo(message: "other error");
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserApi.login(param: loginRequestEntity);
  }
}
