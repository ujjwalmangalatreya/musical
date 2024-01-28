import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical_mingle/UI/screens/common_page/error_page.dart';
import 'package:musical_mingle/UI/screens/common_widgets/loader_widget.dart';
import '../../../blocs/profile/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> followers = ["User1", "User2", "User3", "User4", "User5"];
  late ProfileBloc _profileBloc; // Replace with your actual Bloc type

  @override
  void initState() {
    super.initState();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileBloc.add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Implement the logic to navigate to the Edit Profile screen
              Navigator.pushNamed(context, '/editProfile');
            },
          ),
        ],
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener}
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if(state is ProfileLoading){
              return const Loader();
            }else if(state is ProfileSuccess){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                            NetworkImage('https://example.com/profile.jpg'),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'John Doe',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'City, Country',
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(title: 'Musical Details'),
                          InfoTile(
                              label: 'Instruments', value: 'Piano, Guitar'),
                          InfoTile(label: 'Genres', value: 'Rock, Jazz'),
                          InfoTile(
                              label: 'Influences',
                              value: 'Band/Artist 1, Band/Artist 2'),
                          InfoTile(
                              label: 'Skill Level', value: 'Intermediate'),
                          SectionTitle(title: 'Bio'),
                          Text('Write a short bio here...'),
                          SectionTitle(title: 'Portfolio/Showcase'),
                          InfoTile(
                              label: 'SoundCloud',
                              value: 'https://soundcloud.com/user'),
                          InfoTile(
                              label: 'Music Samples',
                              value: '[sample1.mp3, sample2.mp3]'),
                          SectionTitle(title: 'Availability and Preferences'),
                          InfoTile(label: 'Rehearsals', value: 'Yes'),
                          InfoTile(label: 'Gigs', value: 'No'),
                          InfoTile(label: 'Preferences', value: 'Rock bands'),
                          SectionTitle(
                              title: 'Connections and Collaborations'),
                          InfoTile(
                              label: 'Current Bands',
                              value: 'Band 1, Band 2'),
                          InfoTile(
                              label: 'Collaborations',
                              value: 'Project 1, Project 2'),
                          SectionTitle(title: 'Interests and Hobbies'),
                          Text('Other interests and hobbies'),
                          // Add more privacy settings as needed
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }else {
              return const ErrorPage();
            }
          },
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const InfoTile({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value),
    );
  }
}
