import 'package:ii_test/core/utils/exports.dart';
import 'package:shimmer/shimmer.dart';

class UserLoaderItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.w, top: 18.h, bottom: 18.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black38
                    )
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 220.w,
                      height: 13.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r)
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Container(
                      width: 150.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r)
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}