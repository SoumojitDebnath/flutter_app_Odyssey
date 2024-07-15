import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});


  @override
  State<WatchListPage> createState() => _WatchListPageState();
}


class _WatchListPageState extends State<WatchListPage> {
  final List<String> imageUrls = [
    'https://m.media-amazon.com/images/M/MV5BZWZiNDM1ODQtMzM5MS00ZTU5LWFhMDYtNDc4MmRlZjkyMGY3XkEyXkFqcGdeQXVyMTA5NzIyMDY5._V1_.jpg',
    'https://i.pinimg.com/originals/ac/97/ad/ac97ad45c8cf9e9995c52d6af3ffd7cf.jpg',
    'https://i.pinimg.com/originals/bd/e7/d6/bde7d60a6422ecc9c4782d2054ef01e8.jpg',
    'http://blogtobollywood.com/wp-content/uploads/2016/12/Raees-New-Poster-768x1024.jpg',
    'http://www.boxofficemovies.in/now/wp-content/uploads/New-poster-of-Akshay-Kumar-starrer-Gold-movie.jpg',
    'http://www.scrolldroll.com/wp-content/uploads/2020/01/Drishyam-Must-Watch-Bollywood-Movies-1.jpg',
    'http://1.bp.blogspot.com/-8ciXeKjxBLA/VaIDCluWZbI/AAAAAAAAAdQ/n_xA-KxLPIM/s1600/talaash1.jpg',
    'https://assets.gadgets360cdn.com/pricee/assets/product/202206/Jawan-poster_1655912386.jpg',
    'http://www.boxofficemovies.in/now/wp-content/uploads/Kartik-Aaryan-Bhool-Bhulaiyaa-2-horror-comedy-movie-poster-with-release-date.jpg',
    'http://3.bp.blogspot.com/-QY-DnigQAaI/VaIDA6RhFZI/AAAAAAAAAdA/xNVptjDV1Ks/s1600/force-poster01.jpg',
    'http://1.bp.blogspot.com/-Ye2cKFrs1sU/VaIDAitrToI/AAAAAAAAAc0/vvfwpI404_Y/s1600/chennai-express-bollywood-movie-posters-stills-4.jpg',
    'https://static.moviecrow.com/marquee/shaandaar-new-poster/70069_thumb_665.jpg',
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
          'My List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              if (kDebugMode) {
                print('WatchList');
              }
            },
          ),
        ],
        flexibleSpace: const SizedBox(width: 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            mainAxisExtent: 170,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: imageUrls[index],
              placeholder: (context, url) => const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}