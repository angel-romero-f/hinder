import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hinder/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: const MyApp(),
    ),
  );
}

class MyAppState extends ChangeNotifier {
  // ignore: unused_field
  int _selectedIndex = 0;

  setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'Hinder',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(0, 139, 171, 110)),
            useMaterial3: true,
          ),
          home: MyHomePage(),
        ));
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final title = 'Hinder';

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var selectedIndex = appState._selectedIndex;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = SignInScreen(
          providers: [
            EmailAuthProvider(),
          ],
        );
        break;
      case 2:
        page = const Placeholder();
        break;
      default:
        page = const HomePage();
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: page,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

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
                appState.setSelectedIndex(1);
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
