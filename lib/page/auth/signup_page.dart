import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pemesanan_kamar_hotel/constants.dart';
import 'package:pemesanan_kamar_hotel/controller/auth_controller.dart';
import 'package:pemesanan_kamar_hotel/exception/status_code.dart';
import 'package:pemesanan_kamar_hotel/model/pengguna_model.dart';
import 'package:pemesanan_kamar_hotel/page/auth/signin_page.dart';
import 'package:pemesanan_kamar_hotel/page/home_page.dart';
import 'package:pemesanan_kamar_hotel/code/http_code.dart' as code;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController =
      TextEditingController(text: 'roy1');
  final TextEditingController _emailController =
      TextEditingController(text: 'roy1@gmail.com');
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
            _buttonSignUp(context),
            const SizedBox(height: 20),
            _buttonSignIn(context),
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
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama lengkap',
            ),
          ),
        ),
        const SizedBox(height: 20),
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

  Widget _buttonSignUp(BuildContext context) {
    const double widht = 250;
    return SizedBox(
      width: widht,
      child: _isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton(
              child: const Text('Daftar'),
              onPressed: () async {
                if (context.mounted) {
                  setState(() {
                    _isLoading = true;
                  });
                }
                StatusCode statusCode;
                try {
                  statusCode =
                      await AuthController().signUpWithEmailAndPassword(
                    penggunaBaru: PenggunaModel(
                      nik: '221524030',
                      email: _emailController.value.text,
                      nama: _nameController.value.text,
                      alamat: 'Jl. Raya Cicalengka - Majalaya',
                      noHp: '08587171909',
                      tanggalDaftar: Timestamp.now(),
                      fotoURL: fotoURL,
                    ),
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
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor:
                          statusCode.success ? Colors.green : Colors.red,
                      title: const Text('Pemberitahuan'),
                      content:
                          Text('${statusCode.code} : ${statusCode.message}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        )
                      ],
                    ),
                  );
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

  Widget _buttonSignIn(BuildContext context) {
    const double widht = 250;
    return SizedBox(
      width: widht,
      child: ElevatedButton(
        child: const Text('Masuk'),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const SignInPage(),
            ),
          );
        },
      ),
    );
  }
}
