import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<Map<String, dynamic>> _newsFeed = [];

  // Function to add a new post
  Future<void> _addPost() async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    File? selectedImage;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create a Post'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title input
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Description input
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Pick image button
                ElevatedButton.icon(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      setState(() {
                        selectedImage = File(pickedFile.path);
                      });
                    }
                  },
                  icon: const Icon(Icons.photo),
                  label: const Text('Add Image (Optional)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 10),
                // Show if an image is selected
                if (selectedImage != null)
                  const Text(
                    'Image Selected',
                    style: TextStyle(color: Colors.green),
                  ),
              ],
            ),
          ),
          actions: [
            // Cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            // Post button
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  setState(() {
                    _newsFeed.add({
                      'title': titleController.text,
                      'description': descriptionController.text,
                      'image': selectedImage,
                    });
                  });
                }
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              child: const Text('Post'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
        backgroundColor: const Color(0xFF042142),
      ),
      body: _newsFeed.isEmpty
          ? const Center(child: Text('No news yet.'))
          : ListView.builder(
              itemCount: _newsFeed.length,
              itemBuilder: (context, index) {
                final news = _newsFeed[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          news['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Description
                        Text(
                          news['description'],
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        // Image (if any)
                        if (news['image'] != null)
                          Image.file(
                            news['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
      // Button to add a post
      floatingActionButton: FloatingActionButton(
        onPressed: _addPost,
        backgroundColor: const Color(0xFF042142),
        child: const Icon(
          Icons.add,
          color: Colors.white, // White color for the icon
        ),
      ),
    );
  }
}
