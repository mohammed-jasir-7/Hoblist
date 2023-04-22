import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../controllers/authentication/authentication_bloc.dart';
import '../colors.dart';
import '../custom style/custom_style.dart';
import '../custom widgets/custom_text.dart';
import '../home screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _loginFormkey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scaffold(
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
            child: Form(
              key: _loginFormkey3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
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
                    ),
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
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password is empty";
                        } else if (value.length < 8) {
                          return "password must be at least 8 characters";
                        } else {
                          return null;
                        }
                      },
                      style: GoogleFonts.poppins(color: whiteColor),
                      decoration: textFormFieldStyle("Enter password"),
                    ),
                    height15,
                    SizedBox(
                      width: 200,
                      child:
                          BlocListener<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          if (state is ErrorState) {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.success(
                                backgroundColor: errorColor,
                                message: state.message,
                              ),
                            );
                          } else if (state is LoggedState) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                                (route) => false);
                          }
                        },
                        child: ElevatedButton(
                            onPressed: () {
                              if (_loginFormkey3.currentState!.validate()) {
                                context.read<AuthenticationBloc>().add(
                                    LoginEvent(
                                        name: _nameController.text,
                                        password: _passwordController.text));
                              }
                            },
                            child: CustomText(
                              content: "Login",
                              colour: hobsPrimary,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
