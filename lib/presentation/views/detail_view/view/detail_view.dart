import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmbd/models/movie_information_model/movie_information_model.dart';
import 'package:tmbd/presentation/views/detail_view/controllers/movie_detail_view_model/movie_detail_view_model.dart';
import 'package:tmbd/utilities/constants/url_constants/url_constants.dart';

import '../../../../utilities/constants/color_constants/color_constants.dart';
import '../../../../utilities/constants/text_style_constants/text_style_constants.dart';

class DetailView extends ConsumerWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MovieInformationModel movieDetail = ref.watch(movieDetailViewModelProvider);

    return Scaffold(
      backgroundColor: ColorConstants().darkGrey,
      appBar: AppBar(
        backgroundColor: ColorConstants().darkGrey,
        foregroundColor: ColorConstants().white,
        title: Text(movieDetail.title ?? "", style: TextStyleConstants().w600s18White),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  width: 360.w,
                  height: 200.h,
                  child: CachedNetworkImage(
                    imageUrl: "${UrlConstants().imageBaseUrl}${movieDetail.backdrop_path}",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 360.w,
                  height: 200.h,
                  color: Colors.black.withOpacity(0.75),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, top: 12.h),
                  child: SizedBox(
                    width: 125.w,
                    height: 175.h,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                          width: 125.w,
                          height: 175.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: "${UrlConstants().imageBaseUrl}${movieDetail.poster_path ?? ""}",
                              fit: BoxFit.fill,
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
                              (movieDetail.vote_average ?? 0.0).toStringAsFixed(1),
                              style: TextStyleConstants().w400s12White,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 24.w, bottom: 10.h),
              child: Text("DETAILS", style: TextStyleConstants().w600s18White),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                movieDetail.overview ?? "",
                style: TextStyleConstants().w400s12White,
              ),
            ),
            Divider(height: 30.h, indent: 24.w, endIndent: 24.w, color: ColorConstants().grey),
            Padding(
              padding: EdgeInsets.only(top: 24.h, left: 24.w, bottom: 10.h),
              child: Text("MOVIE'S TYPE", style: TextStyleConstants().w600s18White),
            ),
            SizedBox(
              height: 50.h,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.6,
                ),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: movieDetail.genres?.length ?? 0,
                itemBuilder: (BuildContext context, int index) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: ColorConstants().black), borderRadius: BorderRadius.circular(10)),
                  height: 50.h,
                  child: Text(
                    movieDetail.genres?[index].name ?? "",
                    style: TextStyleConstants().w400s12White,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
