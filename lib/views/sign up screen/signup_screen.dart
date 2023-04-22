import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geeks/controllers/authentication/authentication_bloc.dart';
import 'package:geeks/views/colors.dart';
import 'package:geeks/views/custom%20widgets/custom_text.dart';
import 'package:geeks/views/login%20screen/login_screen.dart';
import 'package:geeks/views/sign%20up%20screen/password_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom style/custom_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        //color: hobsPrimary,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 3, 61, 124), hobsPrimary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                size.height > size.width
                    ? SizedBox(
                        height: size.height / 7,
                      )
                    : const SizedBox.shrink(),
                CustomText(
                  content: "Sign up",
                  colour: whiteColor,
                  weight: FontWeight.w600,
                  size: size.height > size.width
                      ? size.width / 15
                      : size.width / 15,
                ),
                height15,
                const SignUpField(),
                BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is LoadScreenState) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                    }
                  },
                  child: TextButton(
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(LoadLogScreenEvent());
                      },
                      child: CustomText(
                        content: "Already have an account?",
                        colour: whiteColor,
                      )),
                ),
                SizedBox(
                  width: 100,
                  child: Hero(
                    transitionOnUserGestures: false,
                    tag: "logo",
                    child: SvgPicture.asset(
                      "assets/images/logo.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpField extends StatefulWidget {
  const SignUpField({
    super.key,
  });

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _loginFormkey = GlobalKey<FormState>();
  ValueNotifier<bool> changeScreen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginFormkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "name is empty";
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.poppins(color: whiteColor),
                  decoration: textFormFieldStyle("Enter name"),
                ),
                height15,
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    log(value.toString());
                    if (value == null || value.isEmpty) {
                      return "Email is empty";
                    } else if (!EmailValidator.validate(value.trim())) {
                      return "Enter valid email";
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.poppins(color: whiteColor),
                  decoration: textFormFieldStyle("Enter Email ID"),
                ),
                height15,
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "phone number is empty";
                    } else if (value.length < 10) {
                      return "Enter valid phone number";
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.poppins(color: whiteColor),
                  decoration: textFormFieldStyle("Enter phone number"),
                ),
                height15,
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_loginFormkey.currentState!.validate()) {
                          changeScreen.value = true;
                          setState(() {});
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PasswordScreen(
                                email: _emailController.text,
                                name: _nameController.text,
                                phone: _phoneController.text),
                          ));
                        }
                      },
                      child: CustomText(
                        content: "Next",
                        colour: hobsPrimary,
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
