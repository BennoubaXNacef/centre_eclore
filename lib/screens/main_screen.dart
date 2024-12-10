import 'package:flutter/material.dart';
import 'services_page.dart';
import 'news.dart'; // Import the actual NewsPage component

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    const ServicesPage(), // New Services page
    const NewsPage(), // Use the actual NewsPage from news.dart
    const AvisPage(),
    const TherapistsPage(),
    const ContactPage(),
  ];

  // Titles for the pages
  final List<String> _pageTitles = [
    'Services',
    'News',
    'Avis',
    'About the Therapists',
    'Contact Us',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitles[_currentIndex],
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
            color: Colors.white), // Set the arrow color to white
        backgroundColor: const Color(0xFF042142),
        actions: [
          PopupMenuButton<String>(
            icon: const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profile.png'), // Replace with your profile image
            ),
            onSelected: (value) {
              switch (value) {
                case 'Voir Profil':
                  // Action for 'Voir Profil'
                  break;
                case 'Paramètres':
                  // Action for 'Paramètres'
                  break;
                case 'Déconnection':
                  // Action for 'Déconnection'
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return ['Voir Profil', 'Paramètres', 'Déconnection']
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _pages[_currentIndex], // Display the current page

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF042142),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Avis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Therapists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

class AvisPage extends StatelessWidget {
  const AvisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Avis Page', style: TextStyle(fontSize: 24)));
  }
}

class TherapistsPage extends StatelessWidget {
  const TherapistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('About Therapists Page', style: TextStyle(fontSize: 24)));
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Contact Page', style: TextStyle(fontSize: 24)));
  }
}
