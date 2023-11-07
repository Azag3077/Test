import 'package:ecommerce/controller.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true, // Center the app bar title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'images/profile.jpg'), // Replace with your avatar image
            ),
            const SizedBox(height: 20),
            const Text(
              'Bidemi Bakare', // Replace with user's name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Bidemi460@gmail.com', // Replace with user's email
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => controller.onLogOut(context),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
