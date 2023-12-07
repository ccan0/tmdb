// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmbd/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd/presentation/view_model/movie_detail_view_model/movie_detail_view_model.dart';
import 'package:tmbd/presentation/view_model/movies_state_controller/movies_state_controller.dart';
import 'package:tmbd/presentation/view_model/movies_view_model.dart';
import 'package:tmbd/presentation/view_model/search_state_controller.dart';
import 'package:tmbd/presentation/view_model/searched_movies_view_model.dart';
import 'package:tmbd/utilities/constants/color_constants/color_constants.dart';
import 'package:tmbd/utilities/constants/route_constants/route_constants.dart';
import 'package:tmbd/utilities/constants/text_style_constants/text_style_constants.dart';
import 'package:tmbd/utilities/constants/url_constants/url_constants.dart';

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();
  final ScrollController searchScrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<MovieDetailModel>> movies = ref.watch(moviesViewModelProvider(scrollController: scrollController).future);
    Future<List<MovieDetailModel>> searchedMovies = ref.watch(searchedMoviesViewModelProvider(scrollController: searchScrollController).future);
    bool isStateSearch = ref.watch(searchStateControllerProvider);
    bool isSearchedNotEmpty = ref.watch(moviesStateControllerProvider);

    return Scaffold(
      backgroundColor: ColorConstants().darkGrey,
      appBar: AppBar(
        backgroundColor: ColorConstants().darkGrey,
        title: isStateSearch ? Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: ColorConstants().white),
              border: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            cursorColor: ColorConstants().white,
            style: TextStyleConstants().w500s14White,
            onChanged: (val) async{
              await ref.watch(searchedMoviesViewModelProvider().notifier).searchFieldOnChanged(query: val);
            },
          ),
        ) : Text("The Movie DB", style: TextStyleConstants().w600s18White),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          CupertinoButton(
            child: Icon(
              isStateSearch ? Icons.close : Icons.search,
              color: ColorConstants().white,
            ),
            onPressed: () {
              ref.watch(searchStateControllerProvider.notifier).changeOpenState();

              ref.watch(searchedMoviesViewModelProvider().notifier).clearSearchSession(controller: searchController);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: isSearchedNotEmpty,
            child: Expanded(
              child: FutureBuilder(
                  future: searchedMovies,
                  builder: (context, snapshot) {
                    return GridView.builder(
                      controller: searchScrollController,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      itemCount: snapshot.data?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (BuildContext context, int index) => Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: "${UrlConstants().imageBaseUrl}${snapshot.data?[index].poster_path ?? ""}",
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
                                snapshot.data?[index].title ?? "",
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
                                (snapshot.data?[index].vote_average ?? 0.0).toStringAsFixed(1),
                                style: TextStyleConstants().w400s12White,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Visibility(
            visible: !isSearchedNotEmpty,
            child: Expanded(
              child: FutureBuilder(
                  future: movies,
                  builder: (context, snapshot) {
                    return GridView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      itemCount: snapshot.data?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () async{
                          await ref.watch(movieDetailViewModelProvider.notifier).getMovie(movieId: (snapshot.data?[index].id ?? 0).toString());
                          Navigator.pushNamed(context, RouteConstants.detailView);
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: "${UrlConstants().imageBaseUrl}${snapshot.data?[index].poster_path ?? ""}",
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
                                  snapshot.data?[index].title ?? "",
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
                                  (snapshot.data?[index].vote_average ?? 0.0).toStringAsFixed(1),
                                  style: TextStyleConstants().w400s12White,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
