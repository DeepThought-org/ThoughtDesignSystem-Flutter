import 'package:flutter/material.dart';
import 'package:thought_design_system/element/spacing.dart';

@immutable
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
  final IconData? navigationIcon;
  final VoidCallback? onClickNavigation;
  final IconData? actionIcon;
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
    IconData? navigationIcon,
    VoidCallback? onClickNavigation,
    IconData? actionIcon,
    VoidCallback? onClickAction,
  }) : super(
          key: key,
          title: title ?? "",
          navigationIcon: navigationIcon,
          onClickNavigation: onClickNavigation,
          actionIcon: actionIcon,
          onClickAction: onClickAction,
        );

  factory ThoughtToolbar.big({
    Key? key,
    required String title,
    IconData? navigationIcon,
    VoidCallback? onClickNavigation,
  }) = _BigThoughtToolbar;

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

  _buildNavigation(BuildContext context) => navigationIcon != null
      ? Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: clickNavigation(context),
            child: Icon(navigationIcon),
          ),
        )
      : SizedBox(width: 24);

  _buildTitle(BuildContext context) => Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Hopang',
          package: 'thought_design_system',
          color: Theme.of(context).colorScheme.onSurface,
        ),
      );

  _buildAction() => actionIcon != null
      ? Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: CircleBorder(),
            child: Icon(actionIcon),
            onTap: onClickAction,
          ),
        )
      : SizedBox(width: 24);
}

class _BigThoughtToolbar extends ThoughtToolbar {
  _BigThoughtToolbar({
    Key? key,
    required String title,
    IconData? navigationIcon,
    VoidCallback? onClickNavigation,
  }) : super(
          key: key,
          title: title,
          navigationIcon: navigationIcon,
          onClickNavigation: onClickNavigation,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(ThoughtSpacing.large.size),
        child: Column(
          children: [
            _buildNavigation(context),
            _buildTitle(context),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  @override
  _buildNavigation(BuildContext context) => navigationIcon != null
      ? Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: CircleBorder(),
            child: Icon(navigationIcon),
            onTap: clickNavigation(context),
          ),
        )
      : SizedBox.shrink();

  @override
  _buildTitle(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: ThoughtSpacing.large.size),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface,
              fontFamily: 'Hopang',
              package: 'thought_design_system'),
        ),
      );
}
