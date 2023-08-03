import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordGetScreen extends StatefulWidget {
  const PasswordGetScreen({super.key});

  @override
  State<PasswordGetScreen> createState() => _PasswordGetScreenState();
}

class _PasswordGetScreenState extends State<PasswordGetScreen> {
  String name = 'Facebook';
  var password = '';
  List<String> list = [
    'Instagram',
    'Telegram',
    'Github',
    'Gmail',
    'WhatsApp',
    'Facebook',
    'Snapchat',
    'Twitter',
    'Google',
    'Gallery',
    'GB Whatsapp',
    'Facebook Lite',
    'LapTop',
    'File Manager',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Check Your Password',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              padding: const EdgeInsets.only(
                left: 14,
              ),
              value: name,
              onChanged: (value) async {
                name = value!;
                SharedPreferences data = await SharedPreferences.getInstance();
                String? password1 = data.getString(value!);
                password = password1 ?? '-';
                setState(() {});
              },
              items: list.map(
                (e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                },
              ).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Your Password is here:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                    password,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
