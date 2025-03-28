import 'package:flutter/material.dart';
import 'package:tugas_flutter/app/services/auth_service.dart';

class HomePage extends StatelessWidget {
  
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the home page!'),
      ),
    );
  }
}
