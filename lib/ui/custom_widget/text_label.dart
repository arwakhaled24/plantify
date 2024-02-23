import 'package:flutter/material.dart';
import 'package:plantify/ui/theme.dart';

class LabelTextForm extends StatelessWidget {
  String text ;

  LabelTextForm({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
        color: AppTheme.darkText,
        fontSize: 18,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500
    ),
    );
  }
}
