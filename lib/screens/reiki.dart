import 'package:flutter/material.dart';

class ReikiPage extends StatelessWidget {
  const ReikiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reiki'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reiki Title
              const Text(
                'Reiki - Techniques de Guérison Énergétique',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 16),

              // Reiki Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/reiki_explanation.jpg', // Add your image here
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),

              // Reiki Description
              const Text(
                'Le Reiki est une technique japonaise qui vise à rétablir l\'équilibre énergétique '
                'du corps et de l\'esprit. Grâce à des séances douces et relaxantes, cette méthode '
                'favorise la relaxation, réduit le stress et améliore le bien-être général.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),

              // More Details with Icons
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.nature_people, color: Colors.teal),
                    title: Text(
                      'Favorise l\'harmonie intérieure et la relaxation',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.health_and_safety, color: Colors.teal),
                    title: Text(
                      'Stimule les capacités naturelles de guérison du corps',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.energy_savings_leaf, color: Colors.teal),
                    title: Text(
                      'Équilibre l\'énergie et réduit les tensions physiques',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Booking Button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add booking logic here
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Réserver une séance Reiki'),
                        content: const Text(
                            'Votre réservation a été prise en compte ! Nous vous contacterons bientôt pour confirmer.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Réserver une séance'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
