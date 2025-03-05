import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hajj_app/constants.dart';
import 'package:hajj_app/helpers/show_snack_bar.dart';
import 'package:hajj_app/views/home_page.dart';
import 'package:hajj_app/views/register_page.dart';
import 'package:hajj_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_button.dart';

class loginPage extends StatefulWidget {
  loginPage({super.key});

  static String id = 'LoginPage';

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String? email;
  String? password;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        //resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  const CircleAvatar(
                    radius: 100.0,
                    //child: Image.asset('images/Hajj.png'),
                    backgroundImage: AssetImage('assets/images/Hajj.png'),
                    backgroundColor: Colors.white,
                  ),
                  const Text(
                    'Muslim',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            )),
                      ],
                    ),
                  ),
                  CustomFormTextField(
                      onChanged: (value) {
                        email = value;
                      },
                      labelText: 'Email'),
                  const SizedBox(
                  height: 10,
                  ),
                  CustomFormTextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    labelText: 'Password',
                  ),
                  const SizedBox(
                  height: 20,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          
                        });
                        isLoading = true;
                        try {
                          await Login();
                          showSnackBar(context, 'success');
                          Navigator.pushNamed(context, HomePage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,
                                'Wrong password provided for that user.');
                          }
                        } catch (e) {
                          showSnackBar(context, e.toString());
                        }
                        isLoading = false;
                        setState(() {
                          
                        });
                      }
                      //Navigator.pushNamed(context, HomePage.id);
                    },
                      
                    text: 'Sign In',
                  ),
                  const SizedBox(
                  height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?',
                          style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text('Register',
                            style: TextStyle(color: Color(0xffC7EDE6))),
                      )
                    ],
                  ),
                  const SizedBox(
                  height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Login() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
