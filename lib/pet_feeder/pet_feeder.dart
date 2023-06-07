import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thesis_app/pet_feeder/manual_feeding.dart';



class Reminder {
  final String title;
  final DateTime time;

  Reminder({required this.title, required this.time});
}

class PetFeeder extends StatefulWidget {
  const PetFeeder({Key? key}) : super(key: key);

  @override
  State<PetFeeder> createState() => _PetFeederState();
}

class _PetFeederState extends State<PetFeeder> {

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
      backgroundColor: const Color(0xFFFCFCFF),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Pet Feeder", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500,)),
        titleSpacing: 5.0,
        backgroundColor: const Color(0xFF8057BF),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/petFeeder_background.png',
                        width: 400,
                        height: 170,
                        fit: BoxFit.fill,

                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Positioned(
                            child: InkWell(
                              onTap: () {
                                  Navigator.of(context).push(
                                  MaterialPageRoute(
                                  builder: (context) => const ManualFeeding(),
                              ),
                            );
                          },
                              child: Image.asset(
                                'assets/images/feedNow.png', // Replace with your button 1 image path
                                width: 180, // Set the desired width
                                height: 100, // Set the desired height
                              ),
                            ),
                        ),
                        Positioned(
                          child: InkWell(
                            onTap: () {
                            },
                            child: Image.asset(
                              'assets/images/schedule.png', // Replace with your button 2 image path
                              width: 180, // Set the desired width
                              height: 100, // Set the desired height
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
            const SizedBox(height: 10),
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







    );
  }
}
