import 'package:flutter/material.dart';

class HypnosePage extends StatelessWidget {
  const HypnosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hypnose'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hypnosis Title
              const Text(
                'Hypnose - Transformez votre Vie',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 16),

              // Hypnosis Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/hypnose_explanation.jpg', // Add your image here
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),

              // Hypnosis Description
              const Text(
                'L\'hypnose est une technique thérapeutique puissante qui vous permet d\'accéder '
                'à votre subconscient pour résoudre des blocages, améliorer votre bien-être, '
                'et atteindre vos objectifs. Que ce soit pour gérer le stress, arrêter de fumer, '
                'ou améliorer votre confiance en vous, l\'hypnose offre une approche douce et efficace.',
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
                    leading: Icon(Icons.psychology, color: Colors.teal),
                    title: Text(
                      'Accédez à votre potentiel caché',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.smoke_free, color: Colors.teal),
                    title: Text(
                      'Arrêtez de fumer et adoptez des habitudes saines',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.sentiment_very_satisfied,
                        color: Colors.teal),
                    title: Text(
                      'Renforcez votre confiance en vous',
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
                        title: const Text('Réserver une séance Hypnose'),
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
