//import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise_1/API/api.dart';
import 'package:flutter_practise_1/HomeScreens/details_screen.dart';
import 'package:flutter_practise_1/Models/Movie.dart';
import 'package:flutter_practise_1/Widgets/horizontallist.dart';
import 'package:flutter_practise_1/Widgets/trailerlistrow.dart';
//import 'package:palette_generator/palette_generator.dart';
import 'package:styled_text/tags/styled_text_tag_icon.dart';
import 'package:styled_text/widgets/styled_text.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Color? backgroundColor;
  //late String randomMainImagePath;

  int index = 0;

  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> trendingNowMovies;
  late Future<List<Movie>> trendingWeekMovies;


  // final List<String> moviePaths = [
  //   'assets/Netflix_img/movie1.jpg',
  //   'assets/Netflix_img/movie2.jpg',
  //   'assets/Netflix_img/movie3.jpg',
  //   'assets/Netflix_img/movie4.jpg',
  //   'assets/Netflix_img/movie5.jpg',
  //   'assets/Netflix_img/movie6.jpg',
  //   'assets/Netflix_img/movie7.jpg',
  //   'assets/Netflix_img/movie8.jpg',
  //   'assets/Netflix_img/movie9.jpg',
  //   'assets/Netflix_img/movie10.jpg',
  //   'assets/Netflix_img/movie11.jpg',
  //   'assets/Netflix_img/movie12.jpg',
  //   'assets/Netflix_img/movie13.jpg',
  //   'assets/Netflix_img/movie14.jpg',
  //   'assets/Netflix_img/movie15.jpg',
  //   'assets/Netflix_img/movie16.jpg',
  //   'assets/Netflix_img/movie17.jpg',
  //   'assets/Netflix_img/movie18.jpg',
  //   'assets/Netflix_img/movie19.jpg',
  //   'assets/Netflix_img/movie20.jpg',
  //   'assets/Netflix_img/movie21.jpg',
  //   'assets/Netflix_img/movie22.jpg',
  //   'assets/Netflix_img/movie23.jpg',
  //   'assets/Netflix_img/movie24.jpg',
  //   'assets/Netflix_img/movie25.jpg',
  //   'assets/Netflix_img/movie26.jpg',
  //   'assets/Netflix_img/movie27.jpg',
  //   'assets/Netflix_img/movie28.jpg',
  //   'assets/Netflix_img/movie29.jpg',
  //   'assets/Netflix_img/movie30.jpg',
  //   'assets/Netflix_img/movie31.jpg',
  //   'assets/Netflix_img/movie32.jpg',
  //   'assets/Netflix_img/movie33.jpg',
  //   'assets/Netflix_img/movie34.jpg',
  //   'assets/Netflix_img/movie35.jpg',
  //   'assets/Netflix_img/movie36.jpg',
  //   'assets/Netflix_img/movie37.jpg',
  //   'assets/Netflix_img/movie38.jpg',
  //   'assets/Netflix_img/movie39.jpg',
  //   'assets/Netflix_img/movie40.jpg',
  //   'assets/Netflix_img/movie41.jpg',
  //   // Add all your image paths here
  // ];

  final List<Map<String, String>> trailers = [
    {
      'title': 'Terms of Use',
      'description': 'The terms of use for our platform, outlining the rules and regulations.'
    },
    {
      'title': 'Privacy Policy',
      'description': 'Details on how we handle and protect your personal information.'
    },
    {
      'title': 'Cookie Policy',
      'description': 'Information about the use of cookies on our platform.'
    },
    {
      'title': 'Help Center',
      'description': 'Find answers to frequently asked questions and support options.'
    },
  ];

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
    topratedMovies = Api().getTopRatedMovies();
    trendingNowMovies = Api().getTrendingTodayMovies();
    trendingWeekMovies = Api().getTrendingWeekMovies();
    //randomMainImagePath = getRandomMoviePath();
    //_updatePalette();
  }

  // Future<void> _updatePalette() async {
  //   final imageProvider = AssetImage(randomMainImagePath);
  //   final paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);

  //   setState(() {
  //     backgroundColor = _getSuitableBackgroundColor(paletteGenerator.dominantColor?.color ?? Colors.black);
  //   });
  // }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  Color _lightenColor(Color color, [double amount = 0.3]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  Color _getSuitableBackgroundColor(Color color) {
    // Check if the color is too light based on its luminance
    if (color.computeLuminance() > 0.5) {
      return Colors.black; // Default to black if the color is too light
    }
    return color;
  }

  // String getRandomMoviePath() {
  //   final random = Random();
  //   return moviePaths[random.nextInt(moviePaths.length)];
  // }

  // List<String> getRandomMoviePaths() {
  //   final random = Random();
  //   final Set<String> randomPaths = {};
  //   while (randomPaths.length < 10) { // Limited to 10 images for each list
  //     randomPaths.add(moviePaths[random.nextInt(moviePaths.length)]);
  //   }
  //   return randomPaths.toList();
  // }

  Widget buildHorizontalMovieList(String heading,Future<List<Movie>> category) {
    //final randomMoviePaths = getRandomMoviePaths();
    return SizedBox(
      child: FutureBuilder(
        future: category,
         builder: (context,snapshot){
          
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
                );
            }else if(snapshot.hasData){
              return  horizontalList(snapshot: snapshot,title:heading);
            }else{
              return const Center(child:CircularProgressIndicator());
            } 
            
          
         }),
    );
  }

  void navigateToDetailsScreen(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie)),
    );
  }

  Widget buildTrailerLinks() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Trailerlistrow(trailers: trailers, context: context)
    ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _lightenColor(backgroundColor ?? Colors.black),
              backgroundColor ?? Colors.black,
              Colors.black, // Added black color at the end of the gradient
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: StyledText(
                  text: 'Odyssey <camera/>',
                  tags: {
                    'camera': StyledTextIconTag(
                      Icons.theaters,
                      color: Colors.amber,
                    ),
                  },
                  style: const TextStyle(
                    fontFamily: "X Company",
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: logout,
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('TV Shows'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Movies'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        foregroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                      label: const Text('Categories'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                    height: 600,
                    width: 450,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                              child: FutureBuilder(
                                future: trendingNowMovies,
                                 builder: (context,snapshot){
          
                                    if(snapshot.hasError){
                                      return Center(
                                        child: Text(snapshot.error.toString()),
                                        );
                                    }else if(snapshot.hasData){
                                      return  horizontalList(snapshot: snapshot,);
                                    }else{
                                      return const Center(child:CircularProgressIndicator());
                                    } 
                                }),
                            )
                          ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    backgroundColor ?? Colors.black,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              const Text(
                                '#1 Movies Today',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                               FutureBuilder(
                                future: trendingNowMovies,
                                builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty){
                                    return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      navigateToDetailsScreen(snapshot.data![index++]);
                                    },
                                    icon: const Icon(
                                      Icons.play_arrow,
                                      size: 28,
                                    ),
                                    label: const Text(
                                      'Play',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      size: 28,
                                    ),
                                    label: const Text(
                                      'My List',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.brown[700],
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                                }else {
                                        return SizedBox.shrink(); // Return an empty SizedBox if no data is available
                                       }
                                  }),
  
                            ], 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildHorizontalMovieList('Popular on Odyssey',popularMovies),
              buildHorizontalMovieList('Trending Today',trendingNowMovies),
              buildHorizontalMovieList('Top Rated Movies',topratedMovies),
              buildHorizontalMovieList('Trending This Week',trendingWeekMovies),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const SizedBox(height: 10),
                    buildTrailerLinks(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

