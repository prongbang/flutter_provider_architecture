import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/provider_viewmodel.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ProviderViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget child)
      builder;
  final Function(T) initial;

  ProviderWidget({this.builder, this.initial});

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ProviderViewModel>
    extends State<ProviderWidget<T>> {
  T viewModel = locator<T>();

  @override
  void initState() {
    if (widget.initial != null) {
      widget.initial(viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
