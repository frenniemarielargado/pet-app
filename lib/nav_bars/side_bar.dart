import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thesis_app/pet_cam/pet_cam.dart';
import 'package:thesis_app/pet_feeder/pet_feeder.dart';
import 'package:thesis_app/reminder/reminder.dart';
import 'package:thesis_app/user/login.dart';
import 'package:thesis_app/user/user_profile.dart';
import '../model/user_model.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    // Set MyCustomFont as the default font
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          UserAccountsDrawerHeader(
            accountName: Text("${loggedInUser.name}",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
            accountEmail: Text("${loggedInUser.email}",
              style: const TextStyle(
                fontFamily: 'Poppins',
                height: 0.9,
                fontSize: 15,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/user.jpg"),
            ),


            decoration: const BoxDecoration(
              color: Color(0xFF8057BF),
            ),
            otherAccountsPictures: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AccountProfile(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                color: Colors.white,
              ),
            ],
          ),

          ListTile(
            leading: Image.asset('assets/images/events_icon.png', height: 32.0, width: 32.0,),
            title: const Text('Reminder',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReminderList(),
                ),
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/feeder_icon.png', height: 32.0, width: 32.0,),
            title: const Text('Pet Feeder',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PetFeeder(),
                ),
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/cam_icon.png', height: 32.0, width: 32.0,),
            title: const Text('Pet Cam',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PetCamera(),
                ),
              );
            },
          ),
          const SizedBox(height: 50,),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_rounded, size: 30,),
            title: const Text('Log Out',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Poppins',
                fontSize: 17,
              ),
            ),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );

  }
  // the logout function
  Future<void> logout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LogInPage()));
  }
}
