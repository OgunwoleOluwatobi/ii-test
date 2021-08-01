import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/utils/exports.dart';
import 'package:ii_test/ui/views/user_list/user_list_viewmodel.dart';
import 'package:ii_test/ui/widgets/partial_build.dart';
import 'package:shimmer/shimmer.dart';

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<UserListViewModel>(
      builder: (context, model) => InkWell(
        onTap: () => model.setUser(user),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: user.picture ?? '',
                    errorWidget: (context, _, __) => SvgPicture.asset(
                      'img_ph'.svg
                    ),
                    placeholder: (context, _) => Shimmer.fromColors(
                      baseColor: Colors.grey[100]!,
                      highlightColor: Colors.grey[300]!,
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.w, top: 18.h, bottom: 18.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black12
                      )
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.title} ${user.firstName} ${user.lastName}',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                          fontSize: 16.sp,
                        )
                      ),
                      SizedBox(height: 12.h,),
                      Text(
                        '${user.email}',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.black,
                          fontSize: 12.sp,
                        )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}