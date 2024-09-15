import 'package:aisai_app/view/user/user_profile_create_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign-In Method
  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google user credentials
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (e) {
      print(e); // Handle the error
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text(
              'AISAI',
              style: TextStyle(
                color: Color.fromARGB(255, 236, 97, 144),
                fontSize: 65,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Google Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: const Color.fromARGB(0, 255, 255, 255),
                minimumSize: const Size(50, 50),
                padding: EdgeInsets.zero,
              ),
              onPressed: () async {
                User? user = await _signInWithGoogle();
                if (user != null) {
                  // Navigate to profile creation screen after successful sign-in
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProfileCreateScreen()));
                }
              },
              child: SizedBox(
                height: 50,
                child: SvgPicture.asset(
                  'assets/image/google.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Email and Password fields (if needed for email login)
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 40),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileCreateScreen()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 55, 146, 226),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
