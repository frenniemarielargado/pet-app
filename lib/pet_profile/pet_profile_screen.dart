import 'package:flutter/material.dart';
import 'package:thesis_app/home/home_screen.dart';
import 'package:thesis_app/nav_bars/side_bar.dart';
import 'package:thesis_app/pet_profile/edit_pet_profile.dart';



class PetProfile extends StatefulWidget {
  static const String routeName = '/profile';

  const PetProfile({super.key,});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      drawer: const SideBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Custom height of AppBar
        child: AppBar(
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          },
              icon: (Image.asset('assets/images/menu.png', height: 30.0, width: 30.0,)))),
          title: const Text("Pet Profile", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500,)),
          titleSpacing: 5.0,
          backgroundColor: const Color(0xFF8057BF),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30,),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF8F5FF),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20.0),
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                    'assets/images/pet_pic.png'),
              ),
              const SizedBox(height: 5.0),
              const Text(
                'PET NAME',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                ),
              ),

              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(width: 50.0),
                  Text(
                    'Gender',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFA0A0A0),
                        fontFamily: 'Poppins'
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(width: 50.0, height: 0),
                  Text(
                    'Male',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        fontFamily: 'Poppins'

                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(width: 50.0, height: 0),
                  Text(
                    'Birthday',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFA0A0A0),
                        fontFamily: 'Poppins'
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(width: 50.0, height: 0),
                  Text(
                    'June 21, 2019',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        fontFamily: 'Poppins'
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(width: 50.0, height: 0),
                  Text(
                    'Weight',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFA0A0A0),
                        fontFamily: 'Poppins'
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(width: 50.0, height: 0),
                  Text(
                    '10 kg',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'

                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(width: 50.0, height: 0),
                  Text(
                    'Note',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFA0A0A0),
                        fontFamily: 'Poppins'
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 0),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(width: 50.0, height:0),
                  Text(
                    'Dental Issues',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 40.0, bottom: 0.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EditPetProfile(),
                      ),
                    );
                    // Navigate to edit profile page
                  },
                  child: Image.asset('assets/images/edit_profile.png', height: 100.0, width: 100.0,),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF8057BF),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0) {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            } else {
              Navigator.pushReplacementNamed(context, PetProfile.routeName);
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_rounded),
            label: 'Pet Profile',
          ),
        ],
      ),
    );
  }
}