import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sambadev/global.dart';
import 'package:sambadev/models/auth.dart';
import 'package:sambadev/widget_tree.dart';
import 'package:sambadev/widgets/widgets.dart';

class StudentSignIn extends StatefulWidget {
  const StudentSignIn({super.key});

  @override
  State<StudentSignIn> createState() => _StudentSignInState();
}

class _StudentSignInState extends State<StudentSignIn> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? errorMessage;
  bool _isFormValid = false;
  bool _isLoading = false;
  void _validateForm() {
    if (formkey.currentState!.validate()) {
      setState(() {
        _isFormValid = true;
      });
    } else {
      setState(() {
        _isFormValid = false;
      });
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEMailAndPassword(
          email: email.text.trim(), password: password.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Background-1.png"), fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 150,
              ),
              Image.asset(
                "Assets/Logo.png",
                height: 150,
                width: size.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Etudiant',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      forms(
                          controller: email,
                          label: 'email',
                          onChanged: _validateForm,
                          validator: (value) {
                            return EmailValidator.validate(value!.trim())
                                ? null
                                : "Please enter a valid email";
                          }),
                      forms(
                          controller: password,
                          label: 'password',
                          onChanged: _validateForm,
                          validator: (value) {
                            return value!.isEmpty
                                ? "You Must Enter Your Password"
                                : null;
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button(
                              title: 'Sign in with google',
                              onPressed: () {},
                              backgroundColor: Colors.white,
                              foregnColor: primaryColor,
                            ),
                            Button(
                              title: 'Submit',
                              isloading: _isLoading,
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  signInWithEmailAndPassword().then((value) {
                                    if (errorMessage == null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WidgetTree()));
                                    } else {
                                      if (kDebugMode) {
                                        print(errorMessage.toString());
                                      }
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(errorMessage ??
                                                  "Unknown Error")));
                                      errorMessage = null;
                                    }
                                  });
                                }
                              },
                              backgroundColor: primaryColor,
                              foregnColor: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
