import 'package:flutter/material.dart';
import 'package:flutter_office_booking/constants.dart';
import 'package:flutter_office_booking/view_models/auth_view_model.dart';
import 'package:flutter_office_booking/views/screens/home_screen.dart';
import 'package:flutter_office_booking/views/screens/main_screen.dart';
import 'package:flutter_office_booking/views/screens/sign_up_screen.dart';
import 'package:flutter_office_booking/views/widgets/my_text_form_field.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final _formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
        title: const Text(
          'Masuk',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
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
                height: 20,
              ),
              const Text(
                'Password',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              MyPasswordField(
                myController: passwordController,
                myHintText: 'Masukan Password',
                myValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan masukan password';
                  }
                  if (value.length < 8) {
                    return 'Password terlalu pendek';
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
                    bool hasLogin = await authViewModel.signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    if (hasLogin == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login Berhasil'),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          elevation: 0,
                          backgroundColor: Color.fromRGBO(255, 89, 88, 0.2),
                          content: Text(
                            'Masukkan Username dan Password dengan benar.',
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  'Masuk',
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
              'Belum memiliki akun ?',
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text('Daftar di sini')),
          ],
        ),
      ),
    );
  }
}
