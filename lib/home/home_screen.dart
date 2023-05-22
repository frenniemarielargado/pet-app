import 'package:flutter/material.dart';
import 'package:thesis_app/nav_bars/side_bar.dart';
import 'package:thesis_app/pet_cam/pet_cam.dart';
import '../pet_profile/pet_profile_screen.dart';
import 'package:intl/intl.dart';


class Reminder {
  final String title;
  final DateTime time;

  Reminder({required this.title, required this.time});
}

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key}); // Define routeName for HomeScreen

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Reminder> reminders = [
    Reminder(
      title: "Your pet ....",
      time: DateTime(2023, 5, 21, 10, 0), // Example time
    ),
    Reminder(
      title: "Your pet .....",
      time: DateTime(2023, 5, 22, 14, 30), // Example time
    ),
    // Add more reminders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Custom height of AppBar
        child: AppBar(
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          },
              icon: (Image.asset('assets/images/menu.png', height: 30.0, width: 30.0,)))),
          title: const Text("Home", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500,)),
          titleSpacing: 5.0,
          backgroundColor: const Color(0xFF8057BF),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(25.0),
                      child: Image.asset('assets/images/home_1.png',
                        width: 350,
                        height: 240,
                        fit: BoxFit.fill,

                      )
                  ),
                  Positioned(
                    top: 30,
                    right: 30,
                    width: 100,  // Change the width as desired
                    height: 100,  // Change the height as desired
                    child: IconButton(
                      onPressed:() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PetCamera(),
                          ),
                        );
                      },
                      icon: Image.asset('assets/images/next.png',
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]
            ),
            Container(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              alignment: Alignment.topLeft,
              child: const Text('Today',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Color(0xFF8057BF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child:
            ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final formattedTime = DateFormat.jm().format(reminders[index].time);
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color(0xFFF3F3F3),
                      ),
                      child: ListTile(
                        title: Text(
                          reminders[index].title,
                          style: const TextStyle(fontSize: 16.0, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          formattedTime,
                          style: const TextStyle(fontSize: 11.0, fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                );

              },
            ),


            ),
          ]),



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

