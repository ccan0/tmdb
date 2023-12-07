import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmbd/utilities/constants/color_constants/color_constants.dart';
import 'package:tmbd/utilities/constants/text_style_constants/text_style_constants.dart';

class DarkSearchBar extends StatelessWidget {
  const DarkSearchBar({super.key, required this.textEditingController, required this.onChanged});

  final TextEditingController textEditingController;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants().lightBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextField(
        controller: textEditingController,
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
        onChanged: (val) => onChanged(val),
      ),
    );
  }
}
