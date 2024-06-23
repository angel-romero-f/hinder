import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:hinder/widgets/profile_info.dart'; // Ensure this import is correct
import 'package:hinder/widgets/Welcome.dart';

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
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setSelectedIndex(0);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hinder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(0, 139, 171, 110),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final title = 'Hinder';

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var selectedIndex = appState.selectedIndex;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = AuthWrapper();
        break;
      case 2:
        page = ProfileInfo();
        break;
      case 3:
        page = TabBarApp();
      default:
        page = const HomePage();
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        leading: selectedIndex != 0
            ? BackButton(onPressed: () {
                appState.setSelectedIndex(0);
              })
            : null,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: selectedIndex == 2
            ? [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () async {
                    await appState.signOut();
                  },
                ),
              ]
            : null,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text at the top
          const Padding(
            padding: EdgeInsets.all(20.0),
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
                'Create Account/Sign in',
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

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.read<MyAppState>();

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data != null) {
          // User is signed in
          print('User is signed in: ${snapshot.data?.email}');
          Future.microtask(() => appState.setSelectedIndex(2));
          return const SizedBox.shrink();
        } else {
          // User is not signed in
          print('User is not signed in');
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                print('User has signed in');
                appState.setSelectedIndex(2);
              }),
            ],
          );
        }
      },
    );
  }
}
