import 'package:flutter/material.dart';
import 'package:swim/simmer_landing_page.dart';
import 'registration_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swimming Competition App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userType = 'Guest';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swimming Competition App'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pool,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Swimming Competition',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  // Add more icons or images about the swimming competition here
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          userType = "Swimmer";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SwimmerLandingPage()),
                          );
                        },
                        child: const Text('Sign In'),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {
                          userType == 'Swimmer';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()),
                          );
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Guest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pool),
            label: 'Swimmer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Club Official',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'League Admin',
          ),
        ],
        currentIndex: userTypeIndex(),
        onTap: (index) {
          setState(() {
            userType = getUserType(index);
            // Redirect to RegistrationPage if the user type is 'Swimmer'
          });
        },
      ),
    );
  }

  int userTypeIndex() {
    switch (userType) {
      case 'Guest':
        return 0;
      case 'Swimmer':
        return 1;
      case 'Club Official':
        return 2;
      case 'League Admin':
        return 3;
      default:
        return 0;
    }
  }

  String getUserType(int index) {
    switch (index) {
      case 0:
        return 'Guest';
      case 1:
        return 'Swimmer';
      case 2:
        return 'Club Official';
      case 3:
        return 'League Admin';
      default:
        return 'Guest';
    }
  }
}
