import 'package:flutter/material.dart';
import 'package:musical_mingle/UI/screens/musician_screens/learn_screen.dart';
import 'package:musical_mingle/UI/screens/musician_screens/musician_list_screen.dart';
import '../musician_screens/dashboard_screen.dart';


class TabBarMenu extends StatefulWidget {
  const TabBarMenu({Key? key}) : super(key: key);
  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}
class _TabBarMenuState extends State<TabBarMenu> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const MusicianList(),
    const LearnMusic()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Welcome !! Ujjwal Atreya..'),
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        selectedItemColor: Colors.black, // Color for selected item
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Musician',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
        ],

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Add your navigation logic here
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Add your navigation logic here
                Navigator.pop(context); // Close the drawer
              },
            ),
            Divider(),
            ListTile(
              title: Text('Close Drawer'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
