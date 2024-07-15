import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_practise_1/helper/displayMessage.dart';
import 'package:flutter_practise_1/screens/login.dart';
//import 'package:flutter_practise_1/screens/otpScreen.dart';
import 'package:styled_text/tags/styled_text_tag_icon.dart';
import 'package:styled_text/widgets/styled_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _isValid = false;
  String _errorMessage = '';
  String _confirmErrorMessage = '';

  void addUser(BuildContext context) async {
        try {
            UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: _passwordController.text,);
            } on FirebaseAuthException catch(e){
              Navigator.pop(context);
              displayMessageToUser(e.code,context);
            }
  }

  bool _validatePassword(String password) {
    setState(() {
      _errorMessage = '';
      if (password.length < 6) {
        _errorMessage += '- Password must be more than 6 characters.\n';
      }
      if (!password.contains(RegExp(r'[A-Z]'))) {
        _errorMessage += '- At least one Uppercase Letter must be used.\n';
      }
      if (!password.contains(RegExp(r'[a-z]'))) {
        _errorMessage += '- At least one Lowercase Letter must be used.\n';
      }
      if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
        _errorMessage += '- Special Character !@#%^&*(),.?":{}|<> is missing.\n';
      }
      _isValid = _errorMessage.isEmpty;
    });
    return _isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 80, left: 40, right: 40),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 80, right: 10),
                  child: StyledText(
                    text: "ODYSSEY <camera/>",
                    tags: {
                      'camera': StyledTextIconTag(
                        Icons.theaters,
                        color: Colors.amber,
                      ),
                    },
                    style: const TextStyle(
                      fontFamily: "X Company",
                      color: Colors.amber,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                _isValid
                    ? const Text(
                        'Password is valid!',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      )
                    : Text(
                        '$_errorMessage',
                        style:  TextStyle(
                          color: Colors.red[900],
                        ),
                      ),
                SizedBox(height: 20),
                TextField(
                  controller: _confirmPassController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  cursorColor: Colors.white,
                  style:TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  '$_confirmErrorMessage',
                  style: TextStyle(
                    color: Colors.red[900],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    bool isValidPassword = _validatePassword(_passwordController.text);
                    setState(() {
                      if (isValidPassword && _passwordController.text == _confirmPassController.text) {
                        _confirmErrorMessage = '';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  addUser(context);
                                  return Login(status:_isValid);
                                } ));

                      } else if(isValidPassword && _passwordController.text != _confirmPassController.text) {
                        _confirmErrorMessage = 'Passwords are not matched.';
                      }
                    });
                  },
                  child: StyledText(
                    text: "Sign up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 238, 232, 232),
                      fontSize: 24,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.only(
                        left: 112, right: 112, top: 15, bottom: 15),
                  ),
                ),
                SizedBox(height: 45),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: StyledText(
                    text: "Sign in",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.amber),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    padding: EdgeInsets.only(
                        left: 118, right: 115, top: 15, bottom: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
