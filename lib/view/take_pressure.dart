import 'package:flutter/material.dart';
import 'package:tensiometre/widget/custom_form_field.dart';

import '../provider/data.dart';

class TakePressure extends StatefulWidget {
  String sys = "";
  String dias = "";
  String pouls = "";
  bool checkSubmissionPressure = false;
  final Function() pressurSubmit;
  TakePressure({Key? key, required this.pressurSubmit}) : super(key: key);

  @override
  State<TakePressure> createState() => _TakePressureState();
}

class _TakePressureState extends State<TakePressure> {
  final _formKey = GlobalKey<FormState>();

  final items = ["Repos", "Nerveux", "Fatigué", "Essoufflé "];
  late String dropdownvalue = "Repos";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("TensioMetor"),
                Image.asset(
                  "assets/login_img1.jpeg",
                  width: 250,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          isnumbers: true,
                          labelField: "Entrez la valeur",
                          titleField: "Systolique",
                          getFieldValue: (v) {
                            widget.sys = v;
                          },
                          isEmail: false,
                          obscured: false,
                          initialValue: widget.sys,
                        ),
                        CustomFormField(
                          isnumbers: true,
                          labelField: "Entrez la valeur",
                          titleField: "Diastolique",
                          getFieldValue: (v) {
                            widget.dias = v;
                          },
                          isEmail: false,
                          obscured: false,
                          initialValue: widget.dias,
                        ),
                        CustomFormField(
                          isnumbers: true,
                          labelField: "Entrez la valeur",
                          titleField: "Le pouls",
                          getFieldValue: (v) {
                            widget.pouls = v;
                          },
                          isEmail: false,
                          obscured: false,
                          initialValue: widget.pouls,
                        ),

                        /* define drop down status selection */
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButton(
                            elevation: 10,
                            dropdownColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            alignment: Alignment.center,
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextButton(
                            child: const Text("ENREGISTRER"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print(widget.sys);
                                var pressure = Pressure(
                                    int.parse(widget.sys),
                                    int.parse(widget.dias),
                                    int.parse(widget.pouls),
                                    dropdownvalue);
                                updatePressure(pressure).then(((value) {
                                  setState(() {
                                    widget.checkSubmissionPressure = false;
                                  });

                                  /* TODO: CHANGE PAGE */
                                  widget.pressurSubmit();
                                }));
                                /* active circular progress indicator */
                                setState(() {
                                  widget.checkSubmissionPressure = true;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
          !widget.checkSubmissionPressure
              ? const Padding(padding: EdgeInsets.all(0))
              : const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      backgroundColor: Colors.red,
                      valueColor: AlwaysStoppedAnimation(Colors.cyanAccent),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
