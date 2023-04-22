import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geeks/controllers/authentication/authentication_bloc.dart';
import 'package:geeks/views/custom%20widgets/custom_text.dart';
import 'package:geeks/views/home%20screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../colors.dart';
import '../custom style/custom_style.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone});
  final String name;
  final String email;
  final String phone;

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _passwordController = TextEditingController();
  final _conformpasswordController = TextEditingController();
  final _loginFormkey2 = GlobalKey<FormState>();
  String? selectedValue;
  bool isError = false;
  List<String> profession = [
    "accountant",
    "actor",
    "actress",
    "air traffic controller",
    "architect",
    "artist",
    "attorney",
    "banker",
    "bartender",
    "barber,"
        "bookkeeper,"
        "builder",
    "businessman",
    "businesswoman,"
        "businessperson",
    "butcher",
    "carpenter,"
        "cashier,"
        "chef",
    "coach",
    "dental hygienist",
    "dentist,"
        "designer",
    "developer",
    "dietician",
    "doctor",
    "economist",
    "editor",
    "electrician",
    "engineer",
  ];
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
              key: _loginFormkey2,
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
                    TextFormField(
                      obscureText: true,
                      controller: _conformpasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password is empty";
                        } else if (value.length < 8) {
                          return "password must be at least 8 characters";
                        } else if (_passwordController.text != value) {
                          return "password not match";
                        }
                        return null;
                      },
                      style: GoogleFonts.poppins(color: whiteColor),
                      decoration: textFormFieldStyle("Enter password"),
                    ),
                    height15,
                    DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 68, 255),
                            border: Border.all(color: whiteColor, width: 3),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57),
                                  blurRadius: 5)
                            ]),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: DropdownButton(
                              menuMaxHeight: 200,
                              value: selectedValue,
                              hint: CustomText(
                                content: "select profession",
                                colour: blackColor,
                              ),
                              items: profession
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      onTap: () => setState(() {
                                        selectedValue = e;
                                      }),
                                      child: CustomText(
                                        content: e,
                                        colour: blackColor,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {},
                              icon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(Icons.arrow_circle_down_sharp)),
                              iconEnabledColor: blackColor,
                              style: TextStyle(color: blackColor, fontSize: 20),
                              dropdownColor: whiteColor,
                              underline: Container(),
                              isExpanded: true,
                            ))),
                    Visibility(
                      visible: isError,
                      child: CustomText(
                        content: "select  profession",
                        colour: errorColor,
                      ),
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
                          } else if (state is SignedState) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                                (route) => false);
                          }
                        },
                        child: ElevatedButton(
                            onPressed: () {
                              if (_loginFormkey2.currentState!.validate()) {
                                log(selectedValue.toString());
                                if (selectedValue != null) {
                                  context.read<AuthenticationBloc>().add(
                                      SignUpEvent(
                                          userName: widget.name,
                                          email: widget.email,
                                          phone: widget.phone,
                                          password: _passwordController.text));
                                } else {
                                  setState(() {
                                    isError = true;
                                  });
                                }
                              }
                            },
                            child: CustomText(
                              content: "Sign up",
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
