import 'package:flutter/material.dart';
import 'package:pemesanan_kamar_hotel/controller/auth_controller.dart';
import 'package:pemesanan_kamar_hotel/exception/status_code.dart';
import 'package:pemesanan_kamar_hotel/page/auth/signup_page.dart';
import 'package:pemesanan_kamar_hotel/page/home_page.dart';
import 'package:pemesanan_kamar_hotel/code/http_code.dart' as code;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController =
      TextEditingController(text: 'roay1@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'roy123');
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _formSignIn(context),
            _buttonSignIn(context),
            const SizedBox(height: 20),
            _buttonSignUp(context),
          ],
        ),
      ),
    );
  }

  Widget _formSignIn(BuildContext context) {
    const double widht = 250;
    bool visibilityPassword = false;
    return Column(
      children: [
        SizedBox(
          width: widht,
          child: TextField(
            obscureText: false,
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: widht,
          child: TextField(
            obscureText: visibilityPassword,
            controller: _passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Kata sandi',
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buttonSignIn(BuildContext context) {
    const double widht = 250;
    return SizedBox(
      width: widht,
      child: _isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton(
              child: const Text('Masuk'),
              onPressed: () async {
                if (context.mounted) {
                  setState(() {
                    _isLoading = true;
                  });
                }
                StatusCode statusCode;
                try {
                  statusCode =
                      await AuthController().signInWithEmailAndPassword(
                    email: _emailController.value.text,
                    password: _passwordController.value.text,
                  );
                  if (context.mounted && statusCode.code == code.ok) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                } on StatusCode catch (error) {
                  statusCode = error;
                }
                if (context.mounted) {
                  statusCode.showDialogStatusCode(context);
                }
                if (context.mounted) {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
            ),
    );
  }

  Widget _buttonSignUp(BuildContext context) {
    const double widht = 250;
    return SizedBox(
      width: widht,
      child: ElevatedButton(
        child: const Text('Daftar'),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const SignUpPage(),
            ),
          );
        },
      ),
    );
  }
}
