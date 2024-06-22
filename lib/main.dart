import 'package:flutter/material.dart';

void main() {
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
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.end, // Aligns children to the bottom
          children: [
            SizedBox(
              height: 50,
              width: 325,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('hello');
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
                  debugPrint('hello');
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
            const SizedBox(height: 75), // Add some spacing at the bottom
          ],
        ),
      ),
    );
  }
}
