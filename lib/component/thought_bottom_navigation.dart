import 'package:flutter/material.dart';

@immutable
class ThoughtBottomNavigationItem {
  final String name;
  final IconData icon;
  final Widget view;

  ThoughtBottomNavigationItem({
    required this.name,
    required this.icon,
    required this.view,
  });
}

@immutable
abstract class _ThoughtBottomNavigationStyle extends StatefulWidget {
  const _ThoughtBottomNavigationStyle({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<ThoughtBottomNavigationItem> items;
}

class ThoughtBottomNavigation extends _ThoughtBottomNavigationStyle {
  ThoughtBottomNavigation({
    Key? key,
    required List<ThoughtBottomNavigationItem> items,
  }) : super(
          key: key,
          items: items,
        );

  @override
  _ThoughtBottomNavigationState createState() =>
      _ThoughtBottomNavigationState();
}

class _ThoughtBottomNavigationState extends State<ThoughtBottomNavigation> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: widget.items[_index].view),
        _buildBottomNavigationBar(context),
      ],
    );
  }

  _buildBottomNavigationBar(BuildContext context) => BottomNavigationBar(
        items: widget.items
            .map((item) => BottomNavigationBarItem(
                  icon: Padding(
                    child: Icon(item.icon),
                    padding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  label: item.name,
                ))
            .toList(),
        currentIndex: _index,
        onTap: _onTapItem,
        selectedItemColor: Theme.of(context).colorScheme.primaryVariant,
        unselectedItemColor: Colors.grey[800]!,
        selectedLabelStyle: Theme.of(context).textTheme.bodyText2,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
      );

  _onTapItem(int index) {
    setState(() {
      _index = index;
    });
  }
}
