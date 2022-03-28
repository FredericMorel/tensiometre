import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  final String titleField;
  final String labelField;
  TextEditingController? fieldController = TextEditingController();
  final String initialValue;
  bool isEmail;
  bool obscured;
  bool isnumbers;

  Function(String) getFieldValue;

  CustomFormField(
      {Key? key,
      required this.labelField,
      required this.titleField,
      required this.getFieldValue,
      required this.isEmail,
      required this.obscured,
      required this.initialValue,
      required this.isnumbers})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  void initState() {
    super.initState();
    if (widget.isEmail == null) {
      widget.isEmail = false;
    }
    if (widget.obscured == null) {
      widget.obscured = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    /* Redifine controller whith initial value */
    widget.fieldController = TextEditingController(text: widget.initialValue);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              widget.titleField,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        TextFormField(
          keyboardType:
              widget.isnumbers ? TextInputType.number : TextInputType.text,
          obscureText: widget.obscured,
          controller: widget.fieldController,
          onChanged: (v) =>
              widget.getFieldValue(widget.fieldController!.value.text),
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Le champs ne peut pas être vide.";
            } else {
              if (widget.isEmail) {
                if (!RegExp(
                        r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$")
                    .hasMatch(v)) {
                  return "Adresse email invalide";
                }
              }
            }
          },
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelStyle: const TextStyle(fontSize: 12, color: Colors.black),
              labelText: widget.labelField),
        ),
      ],
    );
  }
}
