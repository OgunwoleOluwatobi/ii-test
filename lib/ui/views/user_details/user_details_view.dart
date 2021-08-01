import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ii_test/core/utils/exports.dart';
import 'package:ii_test/ui/views/user_details/user_details_viewmodel.dart';
import 'package:shimmer/shimmer.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserDetailsViewModel>.reactive(
      onModelReady: (model) => model.setup(),
      viewModelBuilder: () => UserDetailsViewModel(),
      builder: (context, model, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: Utils.dark,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: IconThemeData(
                  color: Colors.black
                ),
                expandedHeight: 250.h,
                floating: true,
                pinned: true,
                snap: true,
                elevation: 0,
                backgroundColor: Color(0xFFCACACA),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Container(
                    padding: EdgeInsets.all(5.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Text(
                      '${model.user!.title} ${model.user!.firstName} ${model.user!.lastName}',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontSize: 16.sp,
                      )
                    ),
                  ),
                  background: CachedNetworkImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    imageUrl: model.user!.picture ?? '',
                    errorWidget: (context, _, __) => SvgPicture.asset(
                      'img_ph'.svg
                    ),
                    placeholder: (context, _) => Shimmer.fromColors(
                      baseColor: Colors.grey[100]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFCACACA).withOpacity(.3),
                          borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal Details',
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'FirstName', 
                              value: model.user!.firstName
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'LastName', 
                              value: model.user!.lastName
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'Gender',
                              value: model.user!.gender
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'DOB',
                              value: model.user!.dateOfBirth == null ? null : DateFormatUtil.yyyymmdd.format(DateTime.parse(model.user!.dateOfBirth!))
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'Email',
                              value: model.user!.email
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'Phone',
                              value: model.user!.phone
                            ),
                            SizedBox(height: 25.h,),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFCACACA).withOpacity(.3),
                          borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location Details',
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'Country',
                              value: model.user!.location?.country
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'State',
                              value: model.user!.location?.state
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'City',
                              value: model.user!.location?.city
                            ),
                            SizedBox(height: 25.h,),
                            model.busy(model.user) ? textLoader() : textItem(
                              context: context,
                              title: 'Street',
                              value: model.user!.location?.street
                            ),
                            SizedBox(height: 25.h,),
                          ],
                        ),
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

  Widget textItem({
    required BuildContext context,
    required String title,
    required String? value
  }) {
    return Row(
      children: [
        Text(
          '$title : ',
          style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.black,
            fontSize: 16.sp,
          )
        ),
        Expanded(
          child: Text(
            value ?? 'N/A',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.black,
              fontSize: 14.sp,
            )
          ),
        )
      ],
    );
  }

  Widget textLoader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 220.w,
        height: 13.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r)
        ),
      ),
    );
  }
}