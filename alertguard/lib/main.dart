import 'package:flutter/material.dart';
import 'package:your_app_name/auth.dart'; // Import your authentication service file
import 'package:your_app_name/nav_bar.dart'; // Import your navigation bar file
import 'package:your_app_name/sos_page.dart'; // Import your SOS page file
import 'package:your_app_name/crowdfunding_page.dart'; // Import your crowdfunding page file
import 'package:your_app_name/api_service.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertGuard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppWrapper(),
    );
  }
}

class AppWrapper extends StatefulWidget {
  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  final AuthService _authService = AuthService();
  final ApiService _apiService = ApiService();
  late int _currentIndex;
  late Widget _currentScreen;
  
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _currentScreen = HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _authService.user, // Listen for authentication changes
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data as User?;
          if (user == null) {
            // User not authenticated, show login/signup page
            return AuthPage(
              onSignIn: (email, password) async {
                // Handle sign in logic using _authService.signInWithEmailAndPassword
              },
              onSignUp: (email, password) async {
                // Handle sign up logic using _authService.signUpWithEmailAndPassword
              },
            );
          } else {
            // User authenticated, show main app content
            return Scaffold(
              body: _currentScreen,
              bottomNavigationBar: CustomNavBar(
                onTabTapped: (index) {
                  setState(() {
                    _currentIndex = index;
                    _currentScreen = _buildScreen(_currentIndex);
                  });
                },
                currentIndex: _currentIndex,
              ),
            );
          }
        } else {
          // Loading state
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return HomePage(); // Replace with your home page
      case 1:
        return SOSPage();
      case 2:
        return CrowdfundingPage();
      default:
        return HomePage();
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your home page content
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
