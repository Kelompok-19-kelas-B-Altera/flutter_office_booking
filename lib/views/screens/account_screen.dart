import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../views/screens/main_screen.dart';
import '../../views/screens/sign_in_screen.dart';
import '../../views/screens/sign_up_screen.dart';
import '../../view_models/auth_view_model.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final queryMedia = MediaQuery.of(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: authViewModel.token == null
          ? NotLoggedIn(queryMedia: queryMedia)
          : LoggedIn(queryMedia: queryMedia),
    );
  }
}

class LoggedIn extends StatelessWidget {
  const LoggedIn({
    Key? key,
    required this.queryMedia,
  }) : super(key: key);

  final MediaQueryData queryMedia;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 1,
                child: Container(
                  height: queryMedia.size.height * 0.08,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: queryMedia.size.height * 0.025,
                child: const Text(
                  'Akun',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: queryMedia.size.height * 0.08,
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(authProvider.userData!.picUrl),
                    radius: queryMedia.size.width * 0.15,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      authProvider.addProfileImage();
                    },
                    icon: SvgPicture.asset(
                      'assets/svg/camera.svg',
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: queryMedia.size.width * 0.05,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: queryMedia.size.width * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              initialValue: authProvider.userData!.email,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.5),
              ),
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: queryMedia.size.width * 0.05,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Fullname',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: queryMedia.size.width * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              initialValue: authProvider.userData!.fullName,
              readOnly: true,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.5),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize:
                    Size(double.infinity, queryMedia.size.width * 0.125),
                side: const BorderSide(color: Colors.blue, width: 2),
                primary: Colors.white,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        title: const Text(
                          'Keluar dari akun',
                          textAlign: TextAlign.center,
                        ),
                        content: const Text(
                          'Apakah Anda yakin ingin keluar akun ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        actionsPadding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (ctx) {
                                  authProvider.logOut();
                                  return const MainScreen();
                                }),
                                (route) {
                                  return false;
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(queryMedia.size.width * 0.3,
                                  queryMedia.size.width * 0.1),
                              side: const BorderSide(
                                  color: Colors.blue, width: 2),
                              primary: Colors.white,
                              onPrimary: Colors.white,
                            ),
                            child: const Text(
                              'Keluar akun',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            width: queryMedia.size.width * 0.02,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(queryMedia.size.width * 0.3,
                                  queryMedia.size.width * 0.1),
                            ),
                            child: const Text('Tetap disini'),
                          ),
                        ],
                      );
                    });
              },
              child: const Text(
                'Keluar',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class NotLoggedIn extends StatelessWidget {
  const NotLoggedIn({
    Key? key,
    required this.queryMedia,
  }) : super(key: key);

  final MediaQueryData queryMedia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          child: SafeArea(
              child: Center(
            child: Text(
              'Akun',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: queryMedia.size.height * 0.13,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        queryMedia.size.width * 0.9,
                        queryMedia.size.height * 0.06,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text('Masuk'),
                  ),
                ),
              ),
              Positioned(
                bottom: queryMedia.size.height * 0.05,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(
                        queryMedia.size.width * 0.9,
                        queryMedia.size.height * 0.06,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: queryMedia.size.height * 0.05,
                left: queryMedia.size.width * 0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Temukan pusat kantor terbaik di Jakarta',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        'Cari tempat kantor dimanapun yang kamu inginkan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
