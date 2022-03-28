import 'package:flutter/material.dart';
import 'package:tensiometre/provider/data.dart';
import 'package:tensiometre/widget/custom_form_field.dart';
import 'package:tensiometre/widget/small_text.dart';

class LoginView extends StatefulWidget {
  bool checkUserConnected = false;

  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'TensioMetor',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Color.fromARGB(255, 54, 21, 255)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  'assets/login_img1.jpeg',
                  width: 250,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CustomFormField(
                          isnumbers: false,
                          obscured: false,
                          isEmail: true,
                          titleField: "Email",
                          labelField: "Votre email",
                          getFieldValue: (v) {
                            print(v);
                          },
                          initialValue: "",
                        ),
                        CustomFormField(
                          isnumbers: false,
                          obscured: true,
                          isEmail: false,
                          labelField: "votre mot de passe",
                          titleField: "Mot de passe",
                          getFieldValue: (v) {
                            print(v);
                          },
                          initialValue: "",
                        ),
                        SmallText(
                          text: "Mot de passe oublié ?",
                          textAlign: TextAlign.right,
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              getUser().then((user) {
                                print(user.email);
                                setState(() {
                                  widget.checkUserConnected =
                                      !widget.checkUserConnected;
                                });
                              });
                              setState(() {
                                widget.checkUserConnected =
                                    !widget.checkUserConnected;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                              left: 80,
                              right: 80,
                            ),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 49, 45, 227),
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              'connexion'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SmallText(
                  text: "Vous n'avez pas de compte? Enregistrer-vous",
                  color: Colors.blueAccent,
                ),
                SmallText(text: "Ou enregistrez-vous avec ? S'incrire"),
                SmallText(text: "Ou connectez-vous avec"),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/logos_google-gmail.png",
                        width: 40,
                      ),
                      Image.asset("assets/bi_facebook.png", width: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        /* Indicateur de progression avec un ternaire ! = si different de true */
        !widget.checkUserConnected
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
      ]),
    );
  }
}
