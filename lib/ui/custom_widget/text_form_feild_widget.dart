import 'package:flutter/material.dart';
import 'package:plantify/ui/theme.dart';

class TextFormFeildWidget extends StatelessWidget {
  String hintText;
  bool isPassword;
  TextInputType textInputType;
  TextEditingController controler;
  String? Function(String?)? validator;
  TextFormFeildWidget(
      {
        required this.controler,
        required this.hintText,
        required this.validator,
        this.isPassword = false,
        this.textInputType = TextInputType.text,});
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      decoration: InputDecoration(
        focusColor: AppTheme.lightText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppTheme.lightText, width: 3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppTheme.lightText)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color:AppTheme.lightText)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color:AppTheme.lightText)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppTheme.lightText)),
        fillColor: AppTheme.mainBackground,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontFamily: "Poppins",
          color: AppTheme.lightText,
          fontSize: 18,
        ),
        suffixIcon: isPassword ? Image.asset("assets/images/icons/Eye.png") : null,
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
      controller: controler,
      validator: validator,
    );
  }
}
