import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ProfilePage()));

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true, // Center the app bar title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'images/profile.jpg'), // Replace with your avatar image
            ),
            SizedBox(height: 20),
            Text(
              'Bidemi Bakare', // Replace with user's name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Bidemi460@gmail.com', // Replace with user's email
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Implement logout logic here
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
