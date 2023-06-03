import 'package:flutter/material.dart';

class FutureUse<T> extends StatefulWidget {
  const FutureUse(
      {super.key, required this.future, required this.builder, this.widget});

  final Future<T> future;
  final Widget? widget;
  final Widget Function(BuildContext, AsyncSnapshot<T>) builder;

  @override
  _FutureUseState<T> createState() => _FutureUseState<T>();
}

class _FutureUseState<T> extends State<FutureUse<T>> {
  late Future<T> future;
  @override
  void initState() {
    this.future = widget.future;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return widget.widget ?? Container();
        return widget.builder(context, snapshot);
      },
    );
  }
}
