import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hinder/auth_gate.dart';
import 'package:hinder/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(  
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hinder',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(0, 139, 171, 110)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final title = 'Hinder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: AuthGate(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Text at the top
          const Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'From your next pickleball match or life-long friend.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(), // Pushes the buttons to the bottom
          SizedBox(
            height: 50,
            width: 325,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('Create Account pressed');
              },
              child: const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 13), // Add padding between the buttons
          SizedBox(
            height: 50,
            width: 325,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('Sign in pressed');
              },
              child: const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60), // Add some spacing at the bottom
        ],
      ),
    );
  }
}
