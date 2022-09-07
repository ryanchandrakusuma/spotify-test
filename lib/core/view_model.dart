import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_test/core/base_view_model.dart';

class ViewModel<T extends BaseViewModel> extends StatefulWidget {
  const ViewModel({
    required this.model,
    this.onModelReady,
    required this.builder,
    this.child,
    this.onRetry,
    this.ensureSingleton = false,
    Key? key,
  }) : super(key: key);

  final Widget Function(
    BuildContext context,
    T model,
    Widget? child,
  ) builder;
  final T model;
  final Widget? child;
  final void Function(T)? onModelReady;
  final void Function(T)? onRetry;
  final bool ensureSingleton;

  @override
  State<ViewModel<T>> createState() => _ViewModelState<T>();
}

class _ViewModelState<T extends BaseViewModel> extends State<ViewModel<T>> {
  @override
  void initState() {
    final T model = widget.model;

    widget.onModelReady?.call(model);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ensureSingleton) {
      return ChangeNotifierProvider<T>.value(
        value: widget.model,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ),
      );
    }
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
