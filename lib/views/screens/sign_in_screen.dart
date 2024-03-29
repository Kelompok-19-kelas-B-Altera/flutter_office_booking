import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../view_models/auth_view_model.dart';
import '../../views/screens/main_screen.dart';
import '../../views/screens/sign_up_screen.dart';
import '../../views/widgets/my_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final _formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

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
                  'Masuk',
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
                          backgroundColor: Colors.green,
                          content: Text(
                            'Login Berhasil',
                            textAlign: TextAlign.center,
                          ),
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
