import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String? email;
  const OTPScreen({Key? key, this.email}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  late EmailAuth _emailAuth;

  @override
  void initState() {
    super.initState();
    print(widget.email);
    _emailAuth = EmailAuth(sessionName: "YourSessionName", // or true depending on your server configuration
      );
  
     // Replace with your session name
     
  }


  void sendOTP() async {
    try {
      print("Hello");
      var result = await _emailAuth.sendOtp(recipientMail: widget.email!); // Example usage
      if (result) {
        // Otp sent successfully
        print("OTP sent");
      } else {
        // Error sending OTP
        print("OTP NOT SENT!!!!");
      }
    } catch (e) {
      // Handle errors
      print("Error sending OTP: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _otpController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: "Enter OTP",
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
                ElevatedButton(
                  onPressed: ()=>sendOTP(),
                  child: Text(
                    "Send OTP",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
