import 'package:ii_test/core/models/user.dart';
import 'package:ii_test/core/utils/exports.dart';
import 'package:ii_test/ui/views/user_list/user_list_viewmodel.dart';
import 'package:ii_test/ui/widgets/user_list_item.dart';
import 'package:ii_test/ui/widgets/user_loader_item.dart';

class UserListView extends StatelessWidget {
  const UserListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserListViewModel>.reactive(
      onModelReady: (model) => model.setup(),
      viewModelBuilder: () => UserListViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
        centerTitle: true,
          title: Text(
            'Users',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 22.sp
            ),
          ),
        ),
        body: Container(
          child: model.users == null ? ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            itemCount: 10,
            separatorBuilder: (c, i) {
              return SizedBox(height: 24.h);
            },
            itemBuilder: (BuildContext context, int index) {
              return UserLoaderItem();
            },
          ) : 
          model.users!.isEmpty ? 
          Text(
            'No users availaibe'
          )  : 
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 18.h),
            itemCount: model.users!.length,
            separatorBuilder: (c, i) {
              return SizedBox(height: 24.h);
            },
            itemBuilder: (BuildContext context, int index) {
              User user = model.users![index];
              return UserListItem(user: user);
            },
          ),
        ),
      ),
    );
  }
}