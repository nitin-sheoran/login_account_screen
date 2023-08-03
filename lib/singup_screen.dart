import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var name = '';
  var password = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Singup Page'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              width: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter name',
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  String name = nameController.text;
                  String password = passwordController.text;
                  SharedPreferences prf = await SharedPreferences.getInstance();
                  prf.setString("name", name);
                  prf.setString("password", password);
                  if (name == password) {
                    Fluttertoast.showToast(
                      msg: "Please check name & password",
                      gravity: ToastGravity.CENTER,
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Your account is successfully",
                      gravity: ToastGravity.CENTER,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
