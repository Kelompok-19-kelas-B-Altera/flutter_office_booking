import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_office_booking/views/screens/sign_in_screen.dart';
import '../../constants.dart';
import '../../view_models/auth_view_model.dart';
import '../widgets/my_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final _formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordController2 = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Material(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          elevation: 3,
          child: SafeArea(
              child: Stack(
            alignment: Alignment.center,
            children: [
              const Center(
                child: Text(
                  'Daftar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                myController: emailController,
                myHintText: 'Masukan Email',
                myValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan masukan email';
                  }
                  if (!value.contains(emailValidator)) {
                    return 'Silahkan masukan email yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Nama',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                myController: nameController,
                myHintText: 'Masukan Nama',
                myValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan masukan nama';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Password',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              MyPasswordField2(
                myController: passwordController,
                myHintText: 'Masukan Password',
                myObsecureText: true,
                myValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan masukan password';
                  }
                  if (!passwordValidator.hasMatch(value)) {
                    return 'Silahkan masukan password sesuai format';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Ulangi Password',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              MyPasswordField2(
                myController: passwordController2,
                myHintText: 'Masukan Password',
                myObsecureText: true,
                myValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan masukan password';
                  }
                  if (!passwordValidator.hasMatch(value)) {
                    return 'Silahkan masukan password sesuai format';
                  }
                  if (value != passwordController.text) {
                    return 'Password tidak sama';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool hasLogin = await authViewModel.signUp(
                      email: emailController.text,
                      name: nameController.text,
                      password: passwordController.text,
                    );

                    if (hasLogin == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil Mendaftar'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email Sudah terdaftar'),
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  'Daftar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sudah memiliki akun ?',
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const SignInScreen(),
                    ),
                  );
                },
                child: const Text('Login di sini')),
          ],
        ),
      ),
    );
  }
}
