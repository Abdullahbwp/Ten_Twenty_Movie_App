// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;

  //final VoidCallback? onClick;
  final TextOverflow? overflow;
  final int? maxline;
  final TextDecoration? decoration;
  final TextAlign? textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    //this.onClick,
    this.overflow,
    this.textAlign,
    this.maxline,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxline,
    );
  }
}
