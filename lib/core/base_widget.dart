import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/base_viewmodel.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BaseWidget({this.builder, this.onModelReady});

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}
