import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController soundcloudController = TextEditingController();
  TextEditingController instrumentsController = TextEditingController();
  TextEditingController genresController = TextEditingController();
  TextEditingController influencesController = TextEditingController();
  TextEditingController skillLevelController = TextEditingController();
  TextEditingController preferencesController = TextEditingController();
  TextEditingController currentBandsController = TextEditingController();
  TextEditingController collaborationsController = TextEditingController();

  String? profilePicturePath; // Path to the selected profile picture

  Future<void> _pickProfilePicture() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePicturePath = pickedFile.path;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: profilePicturePath != null
                        ? FileImage(
                      File(profilePicturePath!),
                    ) as ImageProvider<Object>?
                        : const NetworkImage('https://example.com/profile.jpg'),
                  child: IconButton(
                    onPressed: _pickProfilePicture,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  )],
              ),
            ),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Personal Information'),
            EditableField(label: 'Full Name', controller: fullNameController),
            EditableField(label: 'Location', controller: locationController),
            const SectionTitle(title: 'Musical Details'),
            EditableField(label: 'Instruments', controller: instrumentsController),
            EditableField(label: 'Genres', controller: genresController),
            EditableField(label: 'Influences', controller: influencesController),
            EditableField(label: 'Skill Level', controller: skillLevelController),
            const SectionTitle(title: 'Bio'),
            TextFormField(
              controller: bioController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Write a short bio here...',
                border: OutlineInputBorder(),
              ),
            ),
            const  SectionTitle(title: 'Portfolio/Showcase'),
            EditableField(label: 'SoundCloud', controller: soundcloudController),
            EditableField(label: 'Current Bands', controller: currentBandsController),
            EditableField(label: 'Collaborations', controller: collaborationsController),
            const  SectionTitle(title: 'Availability and Preferences'),
            EditableField(label: 'Preferences', controller: preferencesController),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save changes to the database
                // You can use the controllers to access the updated values
                // fullNameController.text, locationController.text, etc.
              },
              child:const Text('Save Changes'),
            ),
          ],
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

class EditableField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const EditableField({Key? key, required this.label, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
