import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:stroke_text/stroke_text.dart';
import 'package:styled_text/styled_text.dart';
import 'package:styled_text/tags/styled_text_tag_icon.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:flutter_practise_1/screens/login.dart';

class Imageslider extends StatefulWidget {
  const Imageslider({super.key});

  @override
  State<Imageslider> createState() => _ImagesliderState();
}

class _ImagesliderState extends State<Imageslider> {
  final List<String> imgList = [
    
    'https://c4.wallpaperflare.com/wallpaper/153/860/948/movie-poster-star-wars-star-wars-the-rise-of-skywalker-2019-year-movies-hd-wallpaper-preview.jpg',
    'https://m.media-amazon.com/images/M/MV5BN2QyZGU4ZDctOWMzMy00NTc5LThlOGQtODhmNDI1NmY5YzAwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMTBhNGUzNzktOGIwNi00MzljLWIxMWItNzU0ZmU4NDJjZTgwXkEyXkFqcGdeQXVyNjUwMjYwMjE@._V1_FMjpg_UX1000_.jpg',
    'https://assets.gadgets360cdn.com/pricee/assets/product/202405/kota_factory_1_1717137011.jpg',
    'https://m.media-amazon.com/images/M/MV5BYWEzMTJiN2ItOThhNC00ZmI2LWI4NTktMGRlYjFjZjU0Mjg4XkEyXkFqcGdeQXVyMTY4OTgxMTEy._V1_.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        title: StyledText(
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
              )),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Padding(padding: EdgeInsets.only(bottom: 80),
                child: 
                 CarouselSlider(
              options: CarouselOptions(
              height: 650.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 600),
              viewportFraction: 1,
            ),
            items: imgList.map((String item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(item),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          ),
                
                ),
              
          
          //2nd item
          
          Container(
            alignment: Alignment.center,
            
            padding: EdgeInsets.only(top: 100),
            child:Column(
              children: [
                
          
            //     const Padding(
            //       padding: EdgeInsets.only(left: 20),
            //       child: 
            //      StrokeText(
            //        text: "Ready to get started?",
                  
            //       textStyle: TextStyle(
            //       color: Colors.black,
            //       fontSize: 32,
            //       fontWeight: FontWeight.bold,
            //       ),
            //       strokeColor: Colors.red,
            //       strokeWidth: 8,
            //     ),
            //     ),
                
            //     const SizedBox(height: 100,),
                
          
            //     const StrokeText(
            //       text: "To Create an account ",
            //       //textAlign: TextAlign.center,
            //       textStyle: TextStyle(
                    
            //         color: Colors.white,
            //         fontSize: 26,
            //         fontWeight: FontWeight.w500,
            //       ),
            //       strokeColor: Colors.blue,
            //       strokeWidth: 4,
            //       ),
                
            //     const SizedBox(height: 40,),
          
            //     ElevatedButton(
            //   onPressed: (){},
            //  child: Text("Registe",
             
          
            // style: TextStyle(
            //   backgroundColor: Colors.red,
            //   color: Colors.black,
            //   fontSize: 40,
            // ),
            // ),
            // style: ElevatedButton.styleFrom(),
            // ),
          
            // const SizedBox(height: 150,),
            //     StyledText(
            //       text:"Already have an account? Then <Login>Login</Login> .",
            //       tags: {
            //         'Login': StyledTextTag(
            //           style: TextStyle(
            //             fontSize: 25,
            //             fontWeight: FontWeight.w900,
            //             color: Colors.red,
            //           )
            //         )
            //       },
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black,
          
            //       )
                   
            //        ),
          
            //     Text("Happy watching!"),
                
                  
            Padding(padding: EdgeInsets.only(top:610),
            child:  
                  ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> Login()));
              },
             child: StyledText(
              text:"Get Started <ra/>",
              tags: {
                'ra': StyledTextIconTag(Icons.arrow_forward_ios_outlined,
                color:Colors.white,
                size: 15)
              },
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[900],
              //shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(left: 110,right: 105,top:15,bottom:15),
                        
              ),
              
            ),
            )
              
              ],
            )
            
          
            
          )
            
          ], 
                ),
        ),
      ),
    );
  }
}
