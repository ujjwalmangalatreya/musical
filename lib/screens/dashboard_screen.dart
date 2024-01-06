
import 'package:flutter/material.dart';



class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
 
  int _currentIndex = 0;
  // Define your pages/screens here
  final List<Widget> _pages = [
    const DashboardPage(),
     //LoginPage(),
    // LearnPage(),
    // BookPage(),
    // MorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Welcome !! Ujjwal Atreya..'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              // Squarebox with Teams and Challenges row
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 180,
                      width: 180,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              // TODO: add images for the card...
                              Icons.people,
                              color: Colors.black,
                              size: 80.0,
                            ),
                          ),
                          Text("Your Band..")
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 180,
                      width: 180,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              // TODO: add images for the card...
                              Icons.event_available,
                              color: Colors.black,
                              size: 80.0,
                            ),
                          ),
                          Text("View All Events..")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              //Join a game nearby ...
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Find a musician nearby",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 162, 160, 155),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "SEE  ALL  > ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius as needed
                      ),
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        width: 350.0,
                        // height: 250.0,
                        child: Center(
                          child: Text('Card $index'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Book A Venue Nearby
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Find a event nearby",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 162, 160, 155),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "SEE  ALL  > ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey[900]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius as needed
                      ),
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        width: 350.0,
                        // height: 250.0,
                        child: Center(
                          child: Text('Card $index'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Refer Friend Section
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(),
                          Column(
                            children: [
                              Text("Refer a music enthusiast"),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  "Earn 100 Karma points by \n inviting your friends")
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              // Applicaiton details and versions...
              //TODO: Application details and version.

              // bottom Navigation
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        selectedItemColor: Colors.black, // Color for selected item
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
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
