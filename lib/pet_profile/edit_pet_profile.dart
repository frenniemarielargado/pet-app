import 'package:flutter/material.dart';
import 'package:thesis_app/pet_profile/pet_profile_screen.dart';
import 'package:intl/intl.dart';


class EditPetProfile extends StatefulWidget {
  const EditPetProfile({super.key});

  @override
  State<EditPetProfile> createState() => _EditPetProfileState();
}

class _EditPetProfileState extends State<EditPetProfile> {
  TextEditingController _petNameController = TextEditingController();
  String _gender = '';
  final TextEditingController _birthdayController = TextEditingController();
  TextEditingController _petWeightController = TextEditingController();
  TextEditingController _petNotesController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _petNameController = TextEditingController();
    _petWeightController = TextEditingController();
    _petNotesController = TextEditingController();
  }

  @override
  void dispose() {
    _petNameController.dispose();
    _petWeightController.dispose();
    _petNotesController.dispose();

    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _birthdayController.text = DateFormat('MMM dd, yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF6),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              const Text(
                'Edit Pet Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10.0,),
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                    'assets/images/pet_pic.png'),
              ),
              const SizedBox(height: 5.0,),
              InkWell(
                onTap: () {
                  // Handle the button press
                },
                child: const Text('Change Profile Picture',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: 'Poppins'
                  ),),
              ),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pet Name',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                      color: Color(0xFF9C9B9B),
                  ),
                ),
              ),
              TextField(
                controller: _petNameController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                    ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Gender',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: Color(0xFF9C9B9B),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: Row(
                        children: [
                          Radio(
                            value: 'male',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          const Text('Male', style:
                              TextStyle(
                                fontFamily: 'Poppins'
                              )
                          ),
                        ],
                      ),
                  ),
                  Expanded(
                    flex: 2,
                      child: Row(
                        children: [
                          Radio(
                            value: 'female',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          const Text('Female', style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          ),
                        ],
                      ),
                  ),
                ],
              ),

              const SizedBox(height: 0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Birthday',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: Color(0xFF9C9B9B),
                  ),
                ),
              ),
              TextField(
                readOnly: true,
                controller: _birthdayController,
                onTap: () {
                  _selectDate(context);
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  suffixIcon: Icon(Icons.calendar_today, color: Color(0xFFFFAB00) ,),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                  ),
                 ),
                ),

              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pet Weight (kg)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: Color(0xFF9C9B9B),
                  ),
                ),
              ),
              TextField(
                controller: _petWeightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Note',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: Color(0xFF9C9B9B),
                  ),
                ),
              ),
              TextField(
                controller: _petNotesController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Enter a general note about your pet.',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),

                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFFA0A0A0)),
                  ),
                ),
              ),


              const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PetProfile(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                  backgroundColor: const Color(0xFFA0A0A0),
                  minimumSize: const Size(150, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),

                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {

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

            ],
          ),
        ]),
      ),
      ));
  }
}

