import 'package:flutter/material.dart';

class PetCamera extends StatefulWidget {
  const PetCamera({Key? key}) : super(key: key);

  @override
  State<PetCamera> createState() => _PetCameraState();
}

class _PetCameraState extends State<PetCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Pet Cam", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500,)),
        titleSpacing: 5.0,
        backgroundColor: const Color(0xFF8057BF),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 150,),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // do something when button 1 is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                    backgroundColor: const Color(0xFF8057BF),
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Camera 1'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // do something when button 2 is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                    backgroundColor: const Color(0xFF8057BF),
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Camera 2'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
