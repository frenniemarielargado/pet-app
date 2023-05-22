import 'package:flutter/material.dart';

class PetFeeder extends StatefulWidget {
  const PetFeeder({Key? key}) : super(key: key);

  @override
  State<PetFeeder> createState() => _PetFeederState();
}

class _PetFeederState extends State<PetFeeder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Pet Feeder", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500,)),
        titleSpacing: 5.0,
        backgroundColor: const Color(0xFF8057BF),
      ),
    );
  }
}
