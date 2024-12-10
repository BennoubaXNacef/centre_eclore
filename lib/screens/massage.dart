import 'package:flutter/material.dart';

class MassagePage extends StatelessWidget {
  const MassagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Massage'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Welcome to Massage Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
