import 'package:ii_test/core/utils/exports.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ReactivePartialBuild<T extends ReactiveViewModel> extends HookViewModelWidget<T> {

  final Function(BuildContext, T) builder;

  ReactivePartialBuild({Key? key, required this.builder, reactive: true}) : super(key: key, reactive: reactive);

  @override
  Widget buildViewModelWidget(BuildContext context, T viewModel) => this.builder(context, viewModel);

}