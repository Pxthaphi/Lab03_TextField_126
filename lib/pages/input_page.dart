// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController =
      TextEditingController(); // Separate controller for password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Login Form"),
                SizedBox(height: 20),
                usernameText(),
                SizedBox(height: 20),
                passwordText(),
                SizedBox(height: 20),
                ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()){
                        debugPrint("Successfully");
                      }
                    },
                    icon: const Icon(Icons.login_rounded),
                    label: const Text("เข้าสู่ระบบ")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField usernameText() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอก Username !!';
        }
        return null;
      },
      controller: nameController,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: "Username",
        hintText: "Enter your username",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 244, 144, 3),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 244, 144, 3),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  TextFormField passwordText() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'กรุณากรอก Password !!';
        }
        return null;
      },
      controller:
          passwordController, // Use passwordController for password field
      decoration: InputDecoration(
        icon: Icon(Icons.lock), // Use lock icon for password field
        labelText: "Password",
        hintText: "Enter your password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 244, 144, 3),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 244, 144, 3),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onChanged: (value) {
        setState(() {});
      },
      obscureText: true, // Hide the entered text in the password field
    );
  }
}
