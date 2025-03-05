// import 'package:chat_app/constants.dart';
// import 'package:chat_app/helpers/show_snack_bar.dart';
// import 'package:chat_app/widgets/custom_button.dart';
// import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hajj_app/constants.dart';
import 'package:hajj_app/helpers/show_snack_bar.dart';
import 'package:hajj_app/views/login_page.dart';
import 'package:hajj_app/widgets/custom_button.dart';
import 'package:hajj_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? confirmpassword;
  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
       // resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 120,),
                 const CircleAvatar(
                  radius: 100.0,
                  //child: Image.asset('images/Hajj.png'),
                  backgroundImage: AssetImage('assets/images/Hajj.png'),
                  backgroundColor: Colors.white,
                ),
                  const Text(
                    'muslim',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'pacifico'),
                  ),
                  //SizedBox(height: 32),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            )),
                      ],
                    ),
                  ),
              
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    onChanged: (value) {
                      email = value;
                    },
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    onChanged: (value) {
                      password = value;
                    },
                    labelText: 'password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    onChanged: (value) {
                      confirmpassword = value;
                    },
                    labelText: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                          
                          });
                          isLoading = true;
                          try {
                            await RegisterUser();
                            Navigator.pop(context, loginPage.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              // ignore: use_build_context_synchronously
                              showSnackBar(
                                  context, 'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              // ignore: use_build_context_synchronously
                              showSnackBar(context,
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            showSnackBar(context, 'there was an error');
                          }
                          isLoading = false;
                          setState(() {
                            
                          });
                          showSnackBar(context, 'Account created successfully');
                        }
                        
                      },
                      text: 'Sign Up'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('already have an account?',
                          style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context, loginPage.id);
                        },
                        child: const Text('Login',
                            style: TextStyle(color: Color(0xffC7EDE6))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> RegisterUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
