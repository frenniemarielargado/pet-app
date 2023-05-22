import 'package:flutter/material.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  String _name = 'User Name';
  String _displayPicture = 'assets/default_profile_picture.jpg'; // Replace with your default profile picture asset path

  void _changeDisplayPicture() {
    setState(() {
      // Replace with your logic to update the display picture
      _displayPicture = 'assets/new_profile_picture.jpg';
    });
  }

  void _editName() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedName = _name;
        return AlertDialog(
          title: const Text('Edit Name', style: TextStyle(
            fontFamily: 'Poppins',
          ),
          ),
          content: SizedBox(
            width: 300.0, // Set the desired width
            height: 200.0, // Set the desired height
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    updatedName = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins'
                    ),
                  ),
                ),
                // Add additional widgets as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel', style: TextStyle(
                fontFamily: 'Poppins',
              ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save', style: TextStyle(
                fontFamily: 'Poppins',
              ),
              ),
              onPressed: () {
                setState(() {
                  _name = updatedName;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account',
            style: TextStyle(
            fontFamily: 'Poppins',
          ),),
          content: const Text('Are you sure you want to delete your account?',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',
                style: TextStyle(
                  fontFamily: 'Poppins'
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onPressed: () {
                // Replace with your logic to delete the account
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: const Color(0xFF8057BF),
            onPressed: () {
              Navigator.of(context).pop();
            }
        ),
        title: const Text('Account Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Color(0xFF8057BF),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,

      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double screenWidth = constraints.maxWidth;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  CircleAvatar(
                    radius: screenWidth < 400 ? 50.0 : 80.0,
                    backgroundImage: AssetImage(_displayPicture),
                  ),

                  const SizedBox(height: 10.0),
                  InkWell(
                    onTap: _changeDisplayPicture,
                    child: const Text('Change Display Picture',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 100),
                          child: Text(
                            _name,
                            style: TextStyle(
                                fontSize: screenWidth < 400 ? 19.0 : 24.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'
                                ),
                              ),
                        ),

                        InkWell(
                          onTap: _editName,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.edit_rounded, size: 22,),
                              SizedBox(width: 8.0),
                              Text('Edit name', style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                  ),

                  const SizedBox(height: 50.0),
                  InkWell(
                    onTap: _deleteAccount,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.delete_rounded, size: 22, color: Colors.red,),
                        SizedBox(width: 8.0),
                        Text('Delete Account', style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                        ),
                      ],
                    ),
                  ),

              ],
              ),
            );
          },
        ),
      ),
    );
  }
}

