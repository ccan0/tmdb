import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmbd/models/movie_information_model/movie_information_model.dart';
import 'package:tmbd/presentation/view_model/movie_detail_view_model/movie_detail_view_model.dart';
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
        title: Text("The Movie DB", style: TextStyleConstants().w600s18White),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(),
              CachedNetworkImage(imageUrl: "${UrlConstants().imageBaseUrl}${movieDetail.backdrop_path}"),
            ],
          ),
        ],
      ),
    );
  }
}