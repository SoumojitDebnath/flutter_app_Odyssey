import 'package:flutter/material.dart';
import 'package:flutter_practise_1/Models/Movie.dart';
import 'package:flutter_practise_1/Widgets/back_button.dart';
import 'package:flutter_practise_1/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const BackBtn(),
            backgroundColor: Colors.grey[700],
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title ?? '',
                style: GoogleFonts.belleza(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.amber,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imgPath}${movie.posterPath ?? ''}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.overview ?? '',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[300],
                    ),
                    
                    textAlign: TextAlign.justify,
                    
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoContainer(
                        'Release date: ',
                        movie.releaseDate ?? '',
                      ),
                      _buildRatingContainer(
                        'Rating: ',
                        movie.voteAverage,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingContainer(String label, double? rating) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            '${rating?.toStringAsFixed(1) ?? ''}/10',
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
