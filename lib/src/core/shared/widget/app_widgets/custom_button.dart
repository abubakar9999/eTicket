// ignore_for_file: deprecated_member_use
import 'package:eticket/src/core/utils/color_utils.dart';
import 'package:eticket/src/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final bool isNotificationButton;
  final int? readyFoodCount;
  int height,width;

   CustomContainer({super.key, required this.icon, required this.text, required this.color, this.isNotificationButton=false, this.readyFoodCount=0,this.height=100,this.width=550});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.h),
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28.r),
        child: Stack(
          children: [

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.w, color: ColorUtils.secondaryColor),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(28.r)),
                  boxShadow: [
                    // BoxShadow(
                    //   color: ColorUtils.secondaryColor.withOpacity(0.6),
                    //   blurRadius: 10,
                    //   spreadRadius: 20,
                    //   offset: const Offset(0, 0),
                    // ),
                    BoxShadow(
                      color: color.withOpacity(0.6),
                      blurRadius: 20.r,
                      spreadRadius: 40.r,
                      offset: Offset(0.w, 0.h),
                    ),
                    // BoxShadow(
                    //   color: ColorUtils.primaryColor.withOpacity(0.45),
                    //   blurRadius: 8,
                    //   spreadRadius: -30,
                    //   offset: const Offset(0, 0),
                    // ),
                    BoxShadow(
                      color: ColorUtils.primaryColor.withOpacity(0.45),
                      blurRadius: 16.r,
                      spreadRadius: -60.r,
                      offset: Offset(0.w, 0.h),
                    ),
                    // BoxShadow(
                    //   color: ColorUtils.primaryColor.withOpacity(1),
                    //   blurRadius: 20,
                    //   spreadRadius: -10,
                    //   offset: const Offset(0, 2),
                    // ),
                    BoxShadow(
                      color: ColorUtils.primaryColor.withOpacity(1),
                      blurRadius: 40.r,
                      spreadRadius: -20.r,
                      offset: Offset(0.w, 4.h),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                icon != null
                    ? Expanded(
                        flex: 2,
                        child: Icon(
                          icon,
                          size: 65.r,
                          color: ColorUtils.black,
                        ),
                      )
                    : Text(''),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 21.h),
                    child: Text(
                      text,
                      textAlign: icon != null ? TextAlign.start : TextAlign.center,
                      style: MyStyle.heading4,
                    ),
                  ),
                ),
              ],
            ),
            isNotificationButton?Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 55.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.w, color: ColorUtils.secondaryColor),
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(360.r)),
                  ),
                  child: Center(child: Text(readyFoodCount.toString(),style: MyStyle.heading1,),),

                )):SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
