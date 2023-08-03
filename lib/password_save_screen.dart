import 'package:flutter/material.dart';
import 'package:login_account_screen/password_get-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordSaveScreen extends StatefulWidget {
  const PasswordSaveScreen({super.key});

  @override
  State<PasswordSaveScreen> createState() => _PasswordSaveScreenState();
}

class _PasswordSaveScreenState extends State<PasswordSaveScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String name = 'Facebook';
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
          'Wel Come',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Select Your Website',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    DropdownButton<String>(
                      padding: const EdgeInsets.only(
                        left: 14,
                      ),
                      value: name,
                      onChanged: (String? item) {
                        passwordController.clear();
                        name = item!;
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
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter Password',
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                setSharedPreferences(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const PasswordGetScreen();
                    }));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check Your Save Password',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }

  Widget setSharedPreferences() {
    return ElevatedButton(
      onPressed: () async {
        String password = passwordController.text;
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString(name, password);
        passwordController.clear();
        if (name != password) {
          Fluttertoast.showToast(
            msg: "Save your password",
            gravity: ToastGravity.CENTER,
          );
        } else {
          Fluttertoast.showToast(
            msg: " Please Enter password",
            gravity: ToastGravity.CENTER,
          );
        }
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Save',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

//
// Drawer(
// child: ListView(
// padding: EdgeInsets.zero,
// children: [
// const DrawerHeader(
// decoration: BoxDecoration(
// color: Colors.blue,
// ),
// child: Text(
// 'Drawer Header',
// style: TextStyle(
// fontSize: 24,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ListTile(
// leading: const Icon(Icons.home),
// title: const Text(
// 'Home',
// ),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// const Divider(),
// ListTile(
// leading: const Icon(
// Icons.settings,
// ),
// title: const Text(
// 'Settings',
// ),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// const Divider(),
// ListTile(
// leading: const Icon(
// Icons.group,
// ),
// title: const Text(
// 'New Group',
// ),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// const Divider(),
// ListTile(
// leading: const Icon(
// Icons.perm_contact_cal_rounded,
// ),
// title: const Text(
// 'Contacts',
// ),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// const Divider(),
// ListTile(
// leading: const Icon(
// Icons.call_outlined,
// ),
// title: const Text(
// 'Calls',
// ),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// const Divider(),
// ListTile(
// leading: const Icon(
// Icons.save_alt,
// ),
// title: const Text(
// 'Saved Messages',
// ),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// const Divider(),
// ListTile(
// leading: const Icon(
// Icons.telegram_outlined,
// ),
// title: const Text(
// 'Telegram Features',
// ),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ],
// ),
// ),