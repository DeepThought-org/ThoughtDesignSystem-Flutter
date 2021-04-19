import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thought_design_system/component/toolbar/thought_toolbar_style.dart';
import 'package:thought_design_system/element/color.dart';
import 'package:thought_design_system/element/spacing.dart';
import 'package:thought_design_system/element/typography.dart';

class EmptyToolbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThoughtColor.Surface,
    );
  }

  @override
  Size get preferredSize => Size(0, 0);
}

class ThoughtToolbar extends StatelessWidget {
  final ThoughtToolbarStyle style;

  final String? title;
  final Widget? navigationIcon;
  final VoidCallback? onClickNavigation;
  final Widget? actionIcon;
  final VoidCallback? onClickAction;

  ThoughtToolbar(
      {Key? key,
      this.style: ThoughtToolbarStyle.Primary,
      this.title,
      this.navigationIcon,
      this.onClickNavigation,
      this.actionIcon,
      this.onClickAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case ThoughtToolbarStyle.Primary:
        return _PrimaryThoughtToolbar(this);
      case ThoughtToolbarStyle.Big:
        return _BigThoughtToolbar(this);
    }
  }
}

class _PrimaryThoughtToolbar extends StatelessWidget {
  final ThoughtToolbar property;

  _PrimaryThoughtToolbar(this.property);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        color: ThoughtColor.Surface,
        width: double.infinity,
        padding: EdgeInsets.all(ThoughtSpacing.Medium.size),
        child: Row(
          children: [
            _buildNavigation(),
            _buildTitle(),
            Spacer(),
            _buildAction()
          ],
        ),
      ),
    );
  }

  _buildNavigation() => property.navigationIcon != null
      ? Padding(
          padding: EdgeInsets.only(right: ThoughtSpacing.Medium.size),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                if (property.onClickNavigation == null) {
                  // TODO Navigator 디폴트 로직 추가
                } else {
                  property.onClickNavigation?.call();
                }
              },
              child: property.navigationIcon,
            ),
          ),
        )
      : SizedBox.shrink();

  _buildTitle() => property.title != null
      ? Text(
          property.title ?? "",
          style: ThoughtTypography.Body1.bold
              .copyWith(color: ThoughtColor.OnSurface),
        )
      : SizedBox.shrink();

  _buildAction() => property.actionIcon != null
      ? Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              property.onClickAction?.call();
            },
            child: property.actionIcon,
          ),
        )
      : SizedBox.shrink();
}

class _BigThoughtToolbar extends StatelessWidget {
  final ThoughtToolbar property;

  _BigThoughtToolbar(this.property);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThoughtColor.Surface,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildNavigation(), _buildTitle()],
      ),
    );
  }

  _buildNavigation() {
    final mediumSpacing = ThoughtSpacing.Medium.size;
    return property.navigationIcon != null
        ? Padding(
            padding: EdgeInsets.only(top: mediumSpacing, left: mediumSpacing),
            child: Material(
              child: InkWell(
                child: property.navigationIcon,
                customBorder: CircleBorder(),
                onTap: () {
                  property.onClickNavigation?.call();
                },
              ),
              color: Colors.transparent,
            ))
        : SizedBox.shrink();
  }

  _buildTitle() {
    final largeSpacing = ThoughtSpacing.Large.size;
    final extraLargeSpacing = ThoughtSpacing.ExtraLarge.size;
    return property.title != null
        ? Padding(
            padding: EdgeInsets.only(
                top: extraLargeSpacing,
                left: largeSpacing,
                bottom: largeSpacing,
                right: largeSpacing),
            child: Text(
              property.title ?? "",
              style: ThoughtTypography.Sub1.bold
                  .copyWith(color: ThoughtColor.OnSurface),
            ),
          )
        : SizedBox.shrink();
  }
}
