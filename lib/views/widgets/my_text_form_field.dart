import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.myController,
    required this.myValidator,
    required this.myHintText,
  }) : super(key: key);

  final TextEditingController myController;
  final String? Function(String? p1)? myValidator;
  final String myHintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      validator: myValidator,
      decoration: InputDecoration(
        hintText: myHintText,
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.black),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(0),
        // ),
      ),
    );
  }
}

class MyPasswordField extends StatefulWidget {
  const MyPasswordField({
    Key? key,
    required this.myController,
    required this.myValidator,
    required this.myHintText,
  }) : super(key: key);

  final TextEditingController myController;
  final String? Function(String? p1)? myValidator;

  final String myHintText;

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool invisibility = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.myController,
      validator: widget.myValidator,
      obscureText: invisibility,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          splashRadius: 20,
          onPressed: () {
            setState(() {
              if (invisibility == false) {
                invisibility = true;
              } else {
                invisibility = false;
              }
            });
          },
          icon: invisibility
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
        hintText: widget.myHintText,
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}

class MyPasswordField2 extends StatefulWidget {
  const MyPasswordField2({
    Key? key,
    required this.myController,
    required this.myValidator,
    required this.myObsecureText,
    required this.myHintText,
  }) : super(key: key);

  final TextEditingController myController;
  final String? Function(String? p1)? myValidator;
  final bool myObsecureText;
  final String myHintText;

  @override
  State<MyPasswordField2> createState() => _MyPasswordField2State();
}

class _MyPasswordField2State extends State<MyPasswordField2> {
  bool invisibility = true;
  bool checkLength = false;
  bool checkUpper = false;
  bool checkNumber = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            setState(() {
              if (value.length < 8) {
                checkLength = false;
              } else {
                checkLength = true;
              }

              if (!RegExp('.*[A-Z].*').hasMatch(value)) {
                checkUpper = false;
              } else {
                checkUpper = true;
              }
              if (!RegExp('.*[0-9].*').hasMatch(value)) {
                checkNumber = false;
              } else {
                checkNumber = true;
              }
            });
          },
          controller: widget.myController,
          validator: widget.myValidator,
          obscureText: invisibility,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              splashRadius: 20,
              onPressed: () {
                setState(() {
                  if (invisibility == false) {
                    invisibility = true;
                  } else {
                    invisibility = false;
                  }
                });
              },
              icon: invisibility
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            hintText: widget.myHintText,
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
            ),
            labelStyle: const TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.circle,
              color: checkLength ? Colors.blue : Colors.grey,
              size: 10,
            ),
            Text(
              ' Minimal 8 karakter',
              style: TextStyle(color: checkLength ? Colors.blue : Colors.grey),
            ),
            const Expanded(child: SizedBox()),
            Icon(
              Icons.circle,
              color: checkUpper ? Colors.blue : Colors.grey,
              size: 10,
            ),
            Text(
              ' 1 Upercase',
              style: TextStyle(color: checkUpper ? Colors.blue : Colors.grey),
            ),
            const Expanded(child: SizedBox()),
            Icon(
              Icons.circle,
              color: checkNumber ? Colors.blue : Colors.grey,
              size: 10,
            ),
            Text(
              ' 1 Angka',
              style: TextStyle(color: checkNumber ? Colors.blue : Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
