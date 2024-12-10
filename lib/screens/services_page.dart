import 'package:flutter/material.dart';
import 'hypnose.dart';
import 'reiki.dart';
import 'massage.dart';

void main() {
  runApp(const CentreEcloreApp());
}

class CentreEcloreApp extends StatelessWidget {
  const CentreEcloreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServicesPage(),
    );
  }
}

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<Map<String, String>> services = [
    {
      "name": "Reiki et soins énergétiques",
      "description": "Techniques de guérison énergétique.",
      "image": "assets/images/reiki.jpg"
    },
    {
      "name": "Blocages émotionnels",
      "description": "Séances d'hypnose thérapeutique.",
      "image": "assets/images/hypnose.jpg"
    },
    {
      "name": "Massages et Rééducations",
      "description": "Relaxation et bien-être par le massage.",
      "image": "assets/images/massage.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.teal, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Rechercher...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey[600]),
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Service Cards
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Column(
                  children: services.map((service) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20), // Add spacing between cards
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to respective pages based on the service name
                          if (service["name"] ==
                              "Reiki et soins énergétiques") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReikiPage(),
                              ),
                            );
                          } else if (service["name"] ==
                              "Blocages émotionnels") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HypnosePage(),
                              ),
                            );
                          } else if (service["name"] ==
                              "Massages et Rééducations") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MassagePage(),
                              ),
                            );
                          }
                        },
                        child: Stack(
                          children: [
                            // Background Image with Gradient Overlay
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    service['image']!,
                                    fit: BoxFit.cover,
                                    height: 200,
                                    width: double.infinity,
                                  ),
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.transparent
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text Overlay
                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service["name"]!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    service["description"]!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
