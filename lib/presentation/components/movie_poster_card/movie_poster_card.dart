import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmbd/utilities/constants/text_style_constants/text_style_constants.dart';
import 'package:tmbd/utilities/constants/url_constants/url_constants.dart';

class MoviePosterCard extends StatelessWidget {
  const MoviePosterCard({super.key, required this.moviePoster, required this.movieName, required this.movieVoteAverage});

  final String moviePoster;
  final String movieName;
  final String movieVoteAverage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: "${UrlConstants().imageBaseUrl}$moviePoster",
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40.h,
            alignment: Alignment.center,
            child: Text(
              movieName,
              textAlign: TextAlign.center,
              style: TextStyleConstants().w500s14White,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.orange,
            ),
            width: 24.w,
            height: 24.w,
            alignment: Alignment.center,
            child: Text(
              movieVoteAverage,
              style: TextStyleConstants().w400s12White,
            ),
          ),
        ),
      ],
    );
  }
}
