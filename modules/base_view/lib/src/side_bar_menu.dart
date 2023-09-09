import 'package:flutter/material.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({
    super.key,
    this.selectedIndex = 0,
    required this.page,
  });

  final int selectedIndex;
  final Widget page;

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  int _selectedIndex = 0;

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Side Bar Menu'),
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Menu Item $index'),
                  selected: _selectedIndex == index,
                  onTap: () => _onMenuItemSelected(index),
                );
              },
            ),
          ),
          // Main content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: widget.page,
            ),
          ),
        ],
      ),
    );
  }
}
