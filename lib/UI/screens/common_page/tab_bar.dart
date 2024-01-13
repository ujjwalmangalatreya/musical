import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical_mingle/UI/screens/musician_screens/learn_screen.dart';
import 'package:musical_mingle/UI/screens/musician_screens/musician_list_screen.dart';
import 'package:musical_mingle/blocs/auth/auth_bloc.dart';
import '../musician_screens/dashboard_screen.dart';

class TabBarMenu extends StatefulWidget {
  const TabBarMenu({Key? key, required this.user}) : super(key: key);
  final User? user;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Welcome ${widget.user?.email ?? "Guest"}'),
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        selectedItemColor: Colors.black,
        // Color for selected item
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
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: const Center(
                  child: CircleAvatar(
                      radius: 100, // Adjust the radius as needed
                      backgroundImage: AssetImage('assets/M2.png')),
                )),
            ListTile(
              title: const Text('P R O F I L E'),
              onTap: () {
                // Add your navigation logic here
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('R E Q U E S T S'),
              onTap: () {
                // Add your navigation logic here
                Navigator.pop(context); // Close the drawer
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('L O G O U T'),
              onTap: () {
                context.read<AuthBloc>().add(SignOutEvent());

              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '© 2024 Musical Mingle. All rights reserved.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
