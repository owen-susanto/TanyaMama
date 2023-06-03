import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/functions/enum_parser.dart';
import 'package:flutter_tanya_mama/widgets/builder/future_use.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter_tanya_mama/functions/loading_function.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';

abstract class BaseScreen extends CoreStatefulWidget {
  final bool scrollable;
  final PageName pageName;
  final Color? backgroundColor;
  final EdgeInsets padding;

  // void Function(VoidCallback fn) setState;

  const BaseScreen(
    this.pageName, {
    this.scrollable = true,
    this.backgroundColor,
    this.padding = Configs.screenEdgeInsets,
    super.key,
  });

  Future<bool> beforeScaffold(BuildContext context) {
    return Future.value(true);
  }

  Widget? floatingActionButton(BuildContext context) {
    return null;
  }

  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget? bottomSheet(BuildContext context) {
    return null;
  }

  Widget? drawer(BuildContext context) {
    return null;
  }

  Widget content(BuildContext context);

  @override
  CoreStatefulWidgetState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends CoreStatefulWidgetState<BaseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureUse(
      future: widget.beforeScaffold(context),
      widget: LoadingFunction.loadingSquareCircle(context),
      builder: (context, snapshot) {
        return KeyboardDismisser(
          child: Scaffold(
            backgroundColor: widget.backgroundColor ?? Colors.white,
            drawer: widget.drawer(context),
            bottomSheet: widget.bottomSheet(context),
            floatingActionButton: widget.floatingActionButton(context),
            bottomNavigationBar: widget.bottomNavigationBar(context),
            body: Padding(
              padding: widget.padding,
              child: _content(context),
            ),
          ),
        );
      },
    );
  }

  Widget _content(BuildContext context) {
    return widget.scrollable
        ? SingleChildScrollView(child: widget.content(context))
        : widget.content(context);
  }
}
