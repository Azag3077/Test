import 'package:ecommerce/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child:
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
                Icons.phone_android,
                size: 100,
            ),
            const SizedBox(height: 75),
            // Hello again!
            Text(
                'Hello Again!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
            ),
            const SizedBox(height: 10),
            const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 20,
                ),
            ),
            const SizedBox(height: 50),

            // email textfield
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
                onPressed: () => controller.onLogin(context),
                style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(
                    Size(double.infinity, 48.0)
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  )
                  // backgroundColor:
                ),
                child: const Text('Sign In'),
            ),

            // sign in button
            const SizedBox(height: 25),
            // not a member? register now
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    // onTap: onTap,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
            ),
          ]),
              ),
        ),
      ),
    );
  }
}
