import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  CustomTextField({super.key, this.hintText,this.inputType, this.onChanged, this.obscureText = false,this.labelText});
  Function(String)? onChanged;
  String? hintText;
  String ?labelText;
  TextInputType?  inputType;
  bool? obscureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
style: const TextStyle(color: Colors.black),
        obscureText: widget.obscureText!,
        onChanged: widget.onChanged,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          hintStyle: TextStyle(color: Colors.blueGrey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}