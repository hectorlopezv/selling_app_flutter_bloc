import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/pages/sign_in/bloc/sigin_in_states.dart';
import 'package:ulearing/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearing/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearing/pages/sign_in/sigin_in_controller.dart';
import 'package:ulearing/pages/sign_in/widgets/build_app_bar.dart';
import 'package:ulearing/pages/sign_in/widgets/build_login_reg_button.dart';
import 'package:ulearing/pages/sign_in/widgets/build_text_field.dart';
import 'package:ulearing/pages/sign_in/widgets/build_third_part_login.dart';
import 'package:ulearing/pages/sign_in/widgets/forgot_password.dart';
import 'package:ulearing/pages/sign_in/widgets/reusable_text.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(title: "Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                    child: reusableText("Or use your email account to login"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(height: 5.h),
                        buildTextField(
                          "Enter your email",
                          "email",
                          "user",
                          (value) {
                            context.read<SignInBloc>().add(
                                  EmailEvent(
                                    email: value,
                                  ),
                                );
                          },
                        ),
                        reusableText("Password"),
                        SizedBox(height: 5.h),
                        buildTextField(
                          "Enter your password",
                          "password",
                          "lock",
                          (value) {
                            context.read<SignInBloc>().add(
                                  PasswordEvent(
                                    password: value,
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                  forgotPassword(),
                  buildLogInAndRegButton("Log In", "login", () {
                    print("login button");
                    SignInController(context: context).handleSignIn("email");
                  }),
                  buildLogInAndRegButton("Register", "register", () {
                    Navigator.of(context).pushNamed("/register");
                  })
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
