import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmbd/utilities/constants/color_constants/color_constants.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({super.key, required this.isStateSearch, required this.onPressed});

  final bool isStateSearch;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(
        isStateSearch ? Icons.close : Icons.search,
        color: ColorConstants().white,
      ),
      onPressed: () => onPressed(),
    );
  }
}
