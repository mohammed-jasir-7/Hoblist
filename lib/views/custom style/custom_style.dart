import 'package:flutter/material.dart';
import 'package:geeks/views/colors.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration textFormFieldStyle(String? hint) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      hintText: hint,
      hintStyle: GoogleFonts.poppins(color: whiteColor),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      focusColor: whiteColor,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor.withOpacity(0.5)),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor),
          borderRadius: const BorderRadius.all(Radius.circular(30))));
}

SizedBox height15 = const SizedBox(
  height: 15,
);
