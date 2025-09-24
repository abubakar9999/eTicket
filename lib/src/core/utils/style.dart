
import 'package:eticket/src/core/utils/all_size.dart';
import 'package:eticket/src/core/utils/color_utils.dart';
import 'package:flutter/material.dart' show TextStyle, FontWeight;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyStyle {
  static TextStyle tableTextStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 30.sp, color: ColorUtils.black,height: 0,);
  static TextStyle tableCapTextStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: 50.sp, color: ColorUtils.black);

  static TextStyle itemTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp, color: ColorUtils.secondaryColor);
  static TextStyle itemPriceTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: ColorUtils.redColor);

  static TextStyle swichButtonTextStyle1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp, color: ColorUtils.black);
  static TextStyle orderTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp, color: ColorUtils.black);

  static TextStyle swichButtonTextStyle2 = TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp, color: ColorUtils.primaryColor);

  static TextStyle titleHeading = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: ColorUtils.secondaryColor,
  );

  static TextStyle heading1 = TextStyle(
    fontSize: 30.sp,
    // fontWeight: FontWeight.bold,
    color: ColorUtils.primaryColor,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: 40.sp,
    color: ColorUtils.secondaryColor,
  );

  static TextStyle heading3 = TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeight.w500,
    color: ColorUtils.secondaryColor,
  );
  static TextStyle companyTitle = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w500,
    color: ColorUtils.secondaryColor,
  );

  static TextStyle heading4 = TextStyle(
    letterSpacing: 1,
    fontSize: 44.sp,
    // fontWeight: FontWeight.bold,
    color: ColorUtils.black,
  );

  static TextStyle heading5 = TextStyle(
    letterSpacing: 1,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
    color: ColorUtils.black,
  );

  static TextStyle heading6 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
    color: ColorUtils.secondaryColor,
  );

  static TextStyle heading7 = TextStyle(
    letterSpacing: 1,
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: ColorUtils.primaryColor,
  );

  static TextStyle heading8 = TextStyle(
    letterSpacing: 1,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: ColorUtils.primaryColor,
  );

  static TextStyle heading9 = TextStyle(
    letterSpacing: 1,
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    color: ColorUtils.black,
  );
  static TextStyle heading10 = TextStyle(
    letterSpacing: 1,
    fontSize: 44.sp,
     fontWeight: FontWeight.bold,
    color: ColorUtils.black,
  );
  static TextStyle heading11 = TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeight.w500,
    color: ColorUtils.primaryColor,
  );
  static TextStyle heading12 = TextStyle(
    letterSpacing: 1,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
    color: ColorUtils.black,
  );
  static TextStyle statusStyle = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
    color: ColorUtils.greyColor,
  );
  static TextStyle printHead = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: ColorUtils.greyColor,
  );
  static TextStyle printHeading2 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w800,
    color: ColorUtils.greyColor,
  );
  static TextStyle printItemText = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w500,
    color: ColorUtils.greyColor,
  );


}

const robotoLight = TextStyle(
  fontFamily: 'Roboto',
  fontSize: AllSizes.fontSizeSmall,
  fontWeight: FontWeight.w300,
);


const robotoRegular = TextStyle(
  fontFamily: 'Roboto',
  fontSize: AllSizes.fontSizeLarge,
  fontWeight: FontWeight.w400,
);

const robotoMedium = TextStyle(
  fontFamily: 'Roboto',
  fontSize: AllSizes.fontSizeLarge,
  fontWeight: FontWeight.w500,
);
const robotoSemiBold = TextStyle(
  fontFamily: 'Roboto',
  fontSize: AllSizes.fontSizeExtraLarge,
  fontWeight: FontWeight.w600,
);

const robotoBold = TextStyle(
  fontFamily: 'Roboto',
  fontSize: AllSizes.fontSizeOverLarge,
  fontWeight: FontWeight.w700,
);
