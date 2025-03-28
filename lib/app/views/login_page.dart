import 'package:flutter/material.dart';
import 'package:tugas_flutter/app/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  Future<void> _login() async {
    try {
      await _authService.login(_emailController.text, _passwordController.text);
      // Arahkan ke halaman home setelah berhasil login
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login gagal: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selamat Datang \nSilahkan Masuk',)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/logo1.png'),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            // Tambahkan tombol untuk mengarahkan ke halaman register
            TextButton(
              onPressed: () {
                // Arahkan ke halaman register
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Belum punya akun? Daftar di sini',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ElevatedButton(onPressed: _login, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
