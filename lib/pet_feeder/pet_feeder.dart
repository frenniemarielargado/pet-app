import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thesis_app/pet_feeder/manual_feeding.dart';
import 'package:thesis_app/pet_feeder/schedule_feeding.dart';

class Reminder {
  final DateTime time;
  final String day;
  int portions;

  Reminder({required this.time, required this.day, required this.portions});
}

class PetFeeder extends StatefulWidget {
  const PetFeeder({Key? key}) : super(key: key);

  @override
  State<PetFeeder> createState() => _PetFeederState();
}

class _PetFeederState extends State<PetFeeder> {

  List<Reminder> reminders = [
    Reminder(time: DateTime(2023, 6, 10, 10, 0), day: 'Monday', portions: 2),
    Reminder(time: DateTime(2023, 6, 10, 10, 0), day: 'Wednesday', portions: 1),
    Reminder(time: DateTime(2023, 6, 10, 10, 0), day: 'Friday', portions: 3),
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ScheduleFeeding(),
                                ),
                              );
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            formattedTime,
                            style: const TextStyle(fontSize: 16.0, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reminders[index].day,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${reminders[index].portions} portions',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_rounded),
                            onPressed: () {
                              setState(() {
                                reminders.removeAt(index);
                              });
                            },
                          ),
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
