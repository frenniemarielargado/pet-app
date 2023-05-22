import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thesis_app/home/home_screen.dart';
import 'package:thesis_app/reminder/add_reminder.dart';
import 'package:thesis_app/reminder/edit_add_reminder.dart'; // Import the intl package

class Reminder {
  final String image;
  final String title;
  final DateTime date;
  final TimeOfDay time;

  Reminder({required this.image, required this.title, required this.date, required this.time});
}

class ReminderList extends StatefulWidget {
  const ReminderList({super.key});

  @override
  State<ReminderList> createState() => _ReminderListState();
}

class _ReminderListState extends State<ReminderList> {
  List<Reminder> reminders = [
    Reminder(
      image: "assets/images/categories/vaccination.png",
      title: "Vaccination",
      date: DateTime(2023, 5, 21),
      time: const TimeOfDay(hour: 10, minute: 0),
    ),
    Reminder(
      image: "assets/images/categories/vetVisit.png",
      title: "Vet Visit",
      date: DateTime(2023, 5, 22),
      time: const TimeOfDay(hour: 14, minute: 30),
    ),
    // Add more reminders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      appBar: AppBar(
      leading: IconButton(
      icon: const Icon(Icons.arrow_back_rounded),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen()));
        },
      ),
        backgroundColor: const Color(0xFF8057BF),
        title: const Text("Reminder", style: TextStyle(
          fontFamily: 'Poppins',
        ),
        ),
      ),
      body: reminders.isEmpty
          ? const Center(
        child: Text(
          "No reminders",
          style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
        ),
      )
          : ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          // Format the date using DateFormat
          final formattedDate = DateFormat("MMMM d, y").format(reminders[index].date);

          // Format the time using DateFormat
          final formattedTime = DateFormat.jm().format(
            DateTime(
              2020,
              1,
              1,
              reminders[index].time.hour,
              reminders[index].time.minute,
            ),
          );

          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF9F9F9)),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ListTile(
                  leading: Image.asset(reminders[index].image, width: 45, height: 45,),
                  title: Text(reminders[index].title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formattedDate, style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        ),
                      ),
                      Text(formattedTime, style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const EditReminder()));

                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteReminder(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),

          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const AddReminder()));
            },
            backgroundColor: const Color(0xFF8057BF),
            child: const Icon(Icons.add_rounded, size: 40),
          ),

      ),
    );
  }

  void deleteReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
  }

  void editReminder(int index) {
    // Implement your logic to edit a reminder here
  }

  void addReminder() {
    // Implement your logic to add a new reminder here
  }
}

