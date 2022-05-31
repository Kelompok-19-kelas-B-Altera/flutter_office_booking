import 'package:flutter/material.dart';
import 'package:flutter_office_booking/view_models/auth_view_model.dart';
import 'package:flutter_office_booking/views/screens/home_screen.dart';
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

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                myTextFormField(
                  myController: emailController,
                  myLabelText: 'Email',
                  myHintText: 'Masukan Email',
                  myObsecureText: false,
                  myValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan masukan email';
                    }
                    if (!value.contains(".") || !value.contains("@")) {
                      return 'Silahkan masukan email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                myTextFormField(
                  myController: passwordController,
                  myLabelText: 'Password',
                  myHintText: 'Masukan Password',
                  myObsecureText: true,
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
                      primary: Colors.black,
                      minimumSize: const Size(double.infinity, 40)),
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
                                builder: (context) => const HomeScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Gagal'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Does not have account?',
                    ),
                    TextButton(onPressed: () {}, child: const Text('Sign Up')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
