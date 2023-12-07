// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmbd/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd/presentation/views/detail_view/controllers/movie_detail_view_model/movie_detail_view_model.dart';
import 'package:tmbd/presentation/views/home_view/components/clickable_movie_poster_card/clickable_movie_poster_card.dart';
import 'package:tmbd/presentation/views/home_view/components/dark_search_bar/dark_search_bar.dart';
import 'package:tmbd/presentation/views/home_view/components/search_bar_button/search_bar_button.dart';
import 'package:tmbd/presentation/views/home_view/controllers/movies_state_controller/movies_state_controller.dart';
import 'package:tmbd/presentation/views/home_view/controllers/movies_view_model/movies_view_model.dart';
import 'package:tmbd/presentation/views/home_view/controllers/search_state_controller/search_state_controller.dart';
import 'package:tmbd/presentation/views/home_view/controllers/searched_movies_view_model/searched_movies_view_model.dart';
import 'package:tmbd/utilities/constants/color_constants/color_constants.dart';
import 'package:tmbd/utilities/constants/route_constants/route_constants.dart';
import 'package:tmbd/utilities/constants/text_style_constants/text_style_constants.dart';

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
        title: isStateSearch
            ? DarkSearchBar(
                textEditingController: searchController,
                onChanged: (String? val) async {
                  await ref.watch(searchedMoviesViewModelProvider().notifier).searchFieldOnChanged(query: val ?? "");
                },
              )
            : Text("The Movie DB", style: TextStyleConstants().w600s18White),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          SearchBarButton(
            isStateSearch: isStateSearch,
            onPressed: () {
              ref.watch(searchStateControllerProvider.notifier).changeOpenState();

              ref.watch(searchedMoviesViewModelProvider().notifier).clearSearchSession(controller: searchController);
            },
          )
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
                      itemBuilder: (BuildContext context, int index) => ClickableMoviePosterCard(
                        moviePoster: snapshot.data?[index].poster_path ?? "",
                        movieName: snapshot.data?[index].title ?? "",
                        movieVoteAverage: (snapshot.data?[index].vote_average ?? 0.0).toStringAsFixed(1),
                        onTap: () async {

                          //In some movies, an error is returned because the "belongs_to_collection" data is different from the type specified in the documentation.
                          await ref.watch(movieDetailViewModelProvider.notifier).getMovie(movieId: (snapshot.data?[index].id ?? 0).toString());

                          Navigator.pushNamed(context, RouteConstants.detailView);
                        },
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
                    itemBuilder: (BuildContext context, int index) => ClickableMoviePosterCard(
                      moviePoster: snapshot.data?[index].poster_path ?? "",
                      movieName: snapshot.data?[index].title ?? "",
                      movieVoteAverage: (snapshot.data?[index].vote_average ?? 0.0).toStringAsFixed(1),
                      onTap: () async {

                        //In some movies, an error is returned because the "belongs_to_collection" data is different from the type specified in the documentation.
                        await ref.watch(movieDetailViewModelProvider.notifier).getMovie(movieId: (snapshot.data?[index].id ?? 0).toString());

                        Navigator.pushNamed(context, RouteConstants.detailView);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
