import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thesis_app/reminder/reminder.dart';
import 'edit_add_reminder.dart';


class EditOthersReminder extends StatefulWidget {
  const EditOthersReminder({super.key});

  @override
  State<EditOthersReminder> createState() => _EditOthersReminderState();
}

class _EditOthersReminderState extends State<EditOthersReminder> {
  String _selectedItem  = 'Others';
  final List<String> _dropdownItems = [
    'Vaccination',
    'Vet Visit',
    'Medication',
    'Deworming',
    'Ticks and Fleas',
    'Grooming',
    'Others'
  ];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('MMM dd, yyyy').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFEF6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: const Color(0xFF8057BF),
              onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const ReminderList()))
          ),
          title: const Text('Edit reminder',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Color(0xFF8057BF),
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: const Text('Select a category:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    hint: const Text('Select Items:'),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down_rounded, size: 45, color: Color(0xFFFCAC0A)),
                    iconSize: 30,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    ),

                    value: _selectedItem,
                    items: _dropdownItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });

                      if (_selectedItem == 'Vaccination') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const EditReminder()));
                      } else if (_selectedItem == 'Vet Visit') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>const EditReminder()));
                      } else if (_selectedItem == 'Medication') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>const EditReminder()));
                      } else if (_selectedItem == 'Deworming') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>const EditReminder()));
                      } else if (_selectedItem == 'Ticks and Fleas') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>const EditReminder()));
                      } else if (_selectedItem == 'Grooming') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>const EditReminder()));
                      }

                    },
                  ),
                ),

                const SizedBox(height: 25.0),
                Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: const Text('Title',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a title',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontSize: 17,
                      ),
                    ),
                    controller: _titleController,
                  ),
                ),

                const SizedBox(height: 25.0),
                Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: const Text('When to remind you?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _dateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Select a date',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontSize: 17,
                      ),
                      suffixIcon: Icon(Icons.calendar_today, color: Color(0xFFFFB319)),
                    ),
                    onTap: () => _selectDate(context),
                  ),
                ),

                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _timeController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Select a time',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontSize: 17,
                      ),
                      suffixIcon: Icon(Icons.access_time, color: Color(0xFFFFB319)),
                    ),
                    onTap: () => _selectTime(context),
                  ),
                ),
                const SizedBox(height: 25.0),
                Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: const Text('Add notes',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black54,

                    ),
                  ),
                ),


                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Notes',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontSize: 17,
                      ),
                    ),
                    maxLines: 4,
                    controller: _notesController,
                  ),
                ),


                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 80),
                  child: ElevatedButton(
                    onPressed: () {
                      // Save logic goes here
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                      backgroundColor: const Color(0xFF8057BF),
                      minimumSize: const Size(150, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text('Save'),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
