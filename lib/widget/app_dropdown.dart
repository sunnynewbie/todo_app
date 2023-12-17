import 'package:flutter/material.dart';
import 'package:todo_list/widget/text_view.dart';

class AppDropDown<T> extends StatelessWidget {
  double? height;
  String? hint;
  List<DropdownMenuItem<T>> items;
  T? value;
  Function(T? type)? onChange;
  List<Widget> Function(BuildContext context)? view;
  Color? borderColor;
  Color? fillcolor;
  bool filled;
  double borderRadius;
  FocusNode? focusNode;
  VoidCallback? onTap;
  String? Function(T? value)? validator;

  AppDropDown({
    required this.items,
    required this.onChange,
    this.hint = "",
    this.value,
    this.height,
    this.fillcolor,
    this.focusNode,
    this.view,
    this.borderColor,
    this.filled = false,
    this.validator,
    this.onTap,
    this.borderRadius = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: items,
      validator: validator,
      selectedItemBuilder: view,
      onChanged: onChange,
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        // helperText: " ",
        fillColor: fillcolor,
        label: TextView(text: hint ?? ''),
        filled: filled,

        alignLabelWithHint: true,
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
    );
  }
}
