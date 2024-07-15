import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});


  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  final List<Map<String, String>> topSearches = [
    {
      'title': 'Dhoom 3',
      'image': 'https://wallpapercave.com/wp/wp8807417.jpg',
    },
    {
      'title': 'War',
      'image': 'https://images.freekaamaal.com/post_images/1569564358.jpg',
    },
    {
      'title': 'Chennai Express',
      'image': 'https://wallpapercave.com/wp/wp4253014.jpg',
    },
    {
      'title': 'Ek Villain',
      'image': 'https://wallpapercave.com/wp/wp8807395.jpg',
    },
    {
      'title': 'Singham Returns',
      'image': 'https://wallpapercave.com/wp/wp8807422.jpg',
    },
    {
      'title': 'Mumbai Saga',
      'image': 'https://wallpapercave.com/wp/wp9059434.jpg',
    },
    {
      'title': 'Padmaavat',
      'image':
          'https://webneel.com/daily/sites/default/files/images/daily/08-2018/1-india-movie-poster-design-bollywood-padmaavat.jpg',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     if (kDebugMode) {
        //       print('Go Back');
        //     }
        //   },
        // ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a show, movie, genre, etc.',
                  hintStyle: const TextStyle(color: Colors.white24),
                  prefixIcon: const Icon(Icons.search, color: Colors.white24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Searches',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: topSearches.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: topSearches[index]['image']!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeOutDuration: const Duration(milliseconds: 500),
                      ),
                      title: Text(
                        topSearches[index]['title']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: const Icon(Icons.play_circle_fill,
                          color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}