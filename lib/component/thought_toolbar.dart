import 'package:flutter/material.dart';
import 'package:thought_design_system/element/spacing.dart';

abstract class _ThoughtToolbarStyle extends StatelessWidget {
  _ThoughtToolbarStyle({
    Key? key,
    required this.title,
    required this.navigationIcon,
    required this.onClickNavigation,
    required this.actionIcon,
    required this.onClickAction,
  }) : super(key: key);

  final String title;
  final Widget? navigationIcon;
  final VoidCallback? onClickNavigation;
  final Widget? actionIcon;
  final VoidCallback? onClickAction;

  VoidCallback clickNavigation(BuildContext context) {
    return onClickNavigation != null
        ? onClickNavigation!
        : () {
            // TODO Default navigation setting
          };
  }
}

class ThoughtToolbar extends _ThoughtToolbarStyle {
  ThoughtToolbar({
    Key? key,
    String? title,
    Widget? navigationIcon,
    VoidCallback? onClickNavigation,
    Widget? actionIcon,
    VoidCallback? onClickAction,
  }) : super(
          key: key,
          title: title ?? "",
          navigationIcon: navigationIcon,
          onClickNavigation: onClickNavigation,
          actionIcon: actionIcon,
          onClickAction: onClickAction,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.surface,
        padding: EdgeInsets.all(ThoughtSpacing.medium.size),
        child: Row(children: [
          _buildNavigation(context),
          Spacer(),
          _buildTitle(context),
          Spacer(),
          _buildAction()
        ]),
      ),
    );
  }

  _buildNavigation(BuildContext context) => super.navigationIcon != null
      ? Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: super.clickNavigation(context),
            child: super.navigationIcon,
          ),
        )
      : SizedBox(width: 24);

  _buildTitle(BuildContext context) => Text(
        super.title,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Hopang',
          package: 'thought_design_system',
          color: Theme.of(context).colorScheme.onSurface,
        ),
      );

  _buildAction() => super.actionIcon != null
      ? Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: CircleBorder(),
            child: super.actionIcon,
            onTap: super.onClickAction,
          ),
        )
      : SizedBox(width: 24);
}
