import 'package:mobile2/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'EDIT PROFILE',
                style: TextStyle(fontSize: 40, color: Colors.blueAccent),
              ),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Name',
              ),
            ),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    //showSnackBar(context, 'Please input your name');
                    //showAlerDialogMaterial('Please Enter Your Name');
                    showAlerDialogCupertino('Please Enter Your Name');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Profile(name: nameController.text),
                      ),
                    );
                    showToast('Name updated: ${nameController.text}');
                  }
                },
                child: const Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.5),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  showSnackBar(BuildContext context, String text) {
    final snackbar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          Navigator.pop(context);
          print('Clicked Undo');
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  showAlerDialogMaterial(String text) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Info'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Menutup dialog
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // Tambahkan logika ketika tombol "Yes" ditekan di sini
              // Misalnya, untuk melakukan tindakan sesuai dengan persetujuan pengguna.
              Navigator.of(context).pop(); // Menutup dialog
            },
            child: const Text('Yes'),
          ),
        ],
        elevation: 5,
        backgroundColor: Colors.white,
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
    );
  }

  showAlerDialogCupertino(String text) {
    showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Info'),
        content: Text(text),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(); // Menutup dialog
            },
            child: Text('No'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              // Tambahkan logika ketika tombol "Yes" ditekan di sini
              // Misalnya, untuk melakukan tindakan sesuai dengan persetujuan pengguna.
              Navigator.of(context).pop(); // Menutup dialog
            },
            child: Text('Yes'),
          ),
        ],
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
    );
  }
}

class FlatButton {}
