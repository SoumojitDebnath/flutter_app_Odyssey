import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_practise_1/firebase_options.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter_practise_1/screens/imageSlider.dart';
import 'package:flutter_practise_1/screens/startscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Myapp());
  }catch(e){
    print('Error initializing Firebase: $e');
  }
  
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Startscreen(),
      
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Open Sans', 
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
      
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//         ),
//       //   appBar: AppBar(
//       //   backgroundColor: Colors.blue[50],
//       //   centerTitle: true,
        
//       //   title: Text("MEDTRIP",
      
//       //   style: TextStyle(
//       //     color: Colors.amber[900],
//       //     fontWeight:FontWeight.bold,
//       //     fontSize: 40, 
//       //   ),),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Image(image: NetworkImage(""))
//           ],
//         ),
//       ),
      
//     );
//   }
// }