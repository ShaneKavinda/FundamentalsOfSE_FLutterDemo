import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dobController,
              decoration:const InputDecoration(
                labelText: 'Date of Birth',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement user registration logic
                // You can store the user details and assign the user type here
                // For simplicity, let's just print the details for now
                print('User registered with the following details:');
                print('First Name: ${firstNameController.text}');
                print('Last Name: ${lastNameController.text}');
                print('Date of Birth: ${dobController.text}');

                // Redirect back to the main page (you may want to navigate to a welcome page)
                Navigator.pop(context);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
