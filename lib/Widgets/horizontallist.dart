import 'package:flutter/material.dart';
import 'package:flutter_practise_1/HomeScreens/details_screen.dart';
import 'package:flutter_practise_1/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class horizontalList extends StatelessWidget {
  const horizontalList({
    super.key,
    required this.snapshot,
    this.title, // Make title optional
  });

  final AsyncSnapshot snapshot;
  final String? title; // Nullable String for title

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 205,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(movie: snapshot.data[index])));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        //height: 50,
                        //width: 260,
                        child: Column(
                          children: [
                            Image.network(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              '${Constants.imgPath}${snapshot.data[index].posterPath}',
                              height: 150,
                              width: 260,
                            ),
                            SizedBox(
                              height:35,
                              child: Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Text('${snapshot.data[index].originalTitle}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return CarouselSlider.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imgPath}${snapshot.data[index].posterPath}',
                ),
              ),
            );
          
        },
        options: CarouselOptions(
          height: 600,          
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16/9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
          
        ),
      );
    }
  }
}
