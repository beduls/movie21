import 'package:flutter/material.dart';

class QTextField extends StatefulWidget {
  const QTextField(
      {required this.label,
      this.onChanged,
      super.key,
      this.id,
      this.value,
      this.validator,
      this.hint,
      this.helper,
      this.maxLength,
      this.onSubmitted,
      this.obscure = false,
      this.enabled = true,
      this.prefixIcon,
      this.suffixIcon,
      this.margin,
      this.textEditingController});
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final double? margin;
  final TextEditingController? textEditingController;

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  // TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    widget.textEditingController?.text = widget.value ?? '';
    super.initState();
  }

  // String getValue() {
  //   return textEditingController.text;
  // }

  // setValue(value) {
  //   textEditingController.text = value;
  // }

  // resetValue() {
  //   textEditingController.text = '';
  // }

  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.margin != null ? (widget.margin ?? 20) : 25),
      child: Container(
        margin: EdgeInsets.only(bottom: widget.margin ?? 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          enabled: widget.enabled,
          // controller: textEditingController,
          controller: widget.textEditingController,
          focusNode: focusNode,
          validator: widget.validator,
          maxLength: widget.maxLength,
          obscureText: widget.obscure,
          decoration: InputDecoration(
            labelText: widget.label,
            border: InputBorder.none,
            suffixIcon: Icon(
              widget.suffixIcon ?? Icons.abc,
            ),
            helperText: widget.helper,
            hintText: widget.hint,
          ),
          onChanged: (value) {
            if (widget.onChanged != null) widget.onChanged!(value);
          },
          onFieldSubmitted: (value) {
            if (widget.onSubmitted != null) widget.onSubmitted!(value);
          },
        ),
      ),
    );
  }
}
