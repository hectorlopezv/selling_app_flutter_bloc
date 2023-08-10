import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/pages/register/bloc/register_bloc.dart';
import 'package:ulearing/pages/register/bloc/register_events.dart';
import 'package:ulearing/pages/register/bloc/register_state.dart';
import 'package:ulearing/pages/register/register_controller.dart';
import 'package:ulearing/pages/sign_in/widgets/build_app_bar.dart';
import 'package:ulearing/pages/sign_in/widgets/build_login_reg_button.dart';
import 'package:ulearing/pages/sign_in/widgets/build_text_field.dart';
import 'package:ulearing/pages/sign_in/widgets/reusable_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) => Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(title: "Sign Up"),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: reusableText(
                          "Enter your details below & free sign up"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User name"),
                          buildTextField(
                            "Enter your username",
                            "username",
                            "user",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UserNameEvent(userName: value));
                            },
                          ),
                          reusableText("Email"),
                          buildTextField(
                            "Enter your Email",
                            "email",
                            "user",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(email: value));
                            },
                          ),
                          reusableText("Password"),
                          buildTextField(
                            "Enter your password",
                            "password",
                            "lock",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(password: value));
                            },
                          ),
                          reusableText("Confirm Password"),
                          buildTextField(
                            "Enter your confirm password",
                            "password",
                            "lock",
                            (value) {
                              context.read<RegisterBloc>().add(
                                  ConfirmPasswordEvent(confirmPassword: value));
                            },
                          ),
                        ],
                      ),
                    ),
                    buildLogInAndRegButton("Signup", "login", () {
                      RegisterController(context: context)
                          .handleEmailRegister();
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
