import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/widget/text_view.dart';

class EditText extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final String? Function(String? value)? onValidate;
  final TextInputType? inputType;
  final int? minLine;
  final int? maxLine;
  final double? height;
  final double? width;
  const EditText(
      {super.key,
      this.label,
      required this.controller,
      this.onValidate,
      this.inputType,
      this.minLine,
      this.maxLine, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          label: TextView(text: label ?? ''),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          floatingLabelBehavior: FloatingLabelBehavior.always,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: onValidate,
        minLines: minLine,
        maxLines: maxLine,
      ),
    );
  }
}
