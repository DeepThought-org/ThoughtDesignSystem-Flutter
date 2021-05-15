import 'package:flutter/material.dart';

class ThoughtScaffold extends StatelessWidget {
  const ThoughtScaffold({
    Key? key,
    required this.body,
    this.fab,
    this.fabLocation,
    this.fabAnimator,
    this.footerButton,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomSheet,
  }) : super(key: key);

  final Widget body;
  final Widget? fab;
  final FloatingActionButtonLocation? fabLocation;
  final FloatingActionButtonAnimator? fabAnimator;
  final Widget? footerButton;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SafeArea(child: body),
      floatingActionButton: fab,
      floatingActionButtonLocation: fabLocation,
      floatingActionButtonAnimator: fabAnimator,
      persistentFooterButtons: footerButton == null ? [] : [footerButton!],
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomSheet: bottomSheet,
    );
  }
}
