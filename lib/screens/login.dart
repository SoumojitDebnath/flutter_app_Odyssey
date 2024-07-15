import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise_1/HomeScreens/page1.dart';
import 'package:flutter_practise_1/helper/displayMessage.dart';
import 'package:flutter_practise_1/screens/registation.dart';
import 'package:styled_text/tags/styled_text_tag_icon.dart';
import 'package:styled_text/widgets/styled_text.dart';

class Login extends StatefulWidget {
  final bool status;
  
  const Login({super.key,this.status= false});
  
  

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginAuth() async{
    showDialog(context: context,
     builder: (context) => const Center(
      child: CircularProgressIndicator(),
     ));

     try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text,);

      //pop loading circle
      if(context.mounted)Navigator.pop(context);

      // Navigate to new screen upon successful login
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Page1()), // Replace NewScreen with your target screen
        );
      }
     } on FirebaseAuthException catch(e){
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
     }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Padding(
        padding: EdgeInsets.only(top:150,left:40,right:40),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 80),
              child: StyledText(
              text: 'Odyssey <camera/> ',
              tags:{
                'camera': StyledTextIconTag(
                  Icons.theaters,
                  color: Colors.amber),
              },              
              style: TextStyle(
                
                fontFamily: "X Company",
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 42,
              )
              ),
                
              ),
              if(widget.status)
                Padding(padding: EdgeInsets.only(bottom:45),
                child:
                      Text('Account Created Successfully !',
                      style:TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )),
                      ), 
              TextField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  
                  style: const TextStyle(
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
                        bottomRight: Radius.circular(5))
                    ),
                    
                  ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  cursorColor: Colors.white,
                  
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
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
                        bottomRight: Radius.circular(5))
                    ),
                    
                  ),
              ),

            SizedBox(height: 50,),
               ElevatedButton(
            onPressed: (){
              
                loginAuth();
                
              
            },
           child: StyledText(
            text:"Sign in",
            // tags: {
            //   'ra': StyledTextIconTag(Icons.arrow_forward_ios_outlined,
            //   color:Colors.white,
            //   size: 15)
            // },
          style: TextStyle(
            color: Color.fromARGB(255, 238, 232, 232),
            fontSize: 24,
          ),
          
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber[700],
            //shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
            ),
            padding: EdgeInsets.only(left: 112,right: 112,top:15,bottom:15),
                      
            ),
            
          ),
          

          SizedBox(height: 45,),
             
               OutlinedButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder:(context)=> Register()));
            },
           child: StyledText(
            text:"Sign up",
           
          style: TextStyle(
            color: Colors.amber,
            fontSize: 24,
          ),
          
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.amber),
            backgroundColor: Colors.black,
            //shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                
            ),
            padding: EdgeInsets.only(left: 110,right: 110,top:15,bottom:15),
                      
            ),
            
          ),
            ],
            ),
        ),
      )
      
      
        )
          
      
    );
  }
}