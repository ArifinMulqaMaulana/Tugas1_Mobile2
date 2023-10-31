import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final name;
  Profile({@required this.name});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            print('Back to previous page');
          },
        ),
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/images/Shelby.jpg'),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              widget.name,
              style: const TextStyle(
                fontSize: 25,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
