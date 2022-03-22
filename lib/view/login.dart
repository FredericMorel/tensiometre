import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tensiometre/widget/small_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'TensioMetor',
                  style: TextStyle(
                      fontSize: 40.0, color: Color.fromARGB(255, 54, 21, 255)),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(
                'assets/login_img1.jpeg',
                width: 250,
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelStyle:
                                TextStyle(fontSize: 12, color: Colors.black),
                            labelText: 'Votre adresse email'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Mot de passe',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelStyle:
                                TextStyle(fontSize: 12, color: Colors.black),
                            labelText: 'Votre mot de passe'),
                      ),
                      SmallText(
                        text: "Mot de passe oublié ?",
                        textAlign: TextAlign.right,
                      ),
                      TextButton(
                        onPressed: () {},
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
    );
  }
}

class LittleText extends StatelessWidget {
  const LittleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          alignLabelWithHint: true,
          labelStyle: TextStyle(fontSize: 12, color: Colors.black),
          labelText: 'Votre adresse email'),
    );
  }
}
