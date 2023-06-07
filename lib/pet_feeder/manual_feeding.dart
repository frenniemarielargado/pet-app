import 'package:flutter/material.dart';

class ManualFeeding extends StatefulWidget {
  const ManualFeeding({Key? key}) : super(key: key);

  @override
  State<ManualFeeding> createState() => _ManualFeedingState();
}

class _ManualFeedingState extends State<ManualFeeding> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF6),
      appBar: AppBar(
        title: const Text(
          'Feed Now',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    physics: const FixedExtentScrollPhysics(),
                    perspective: 0.001,
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (BuildContext context, int index) {
                        final number = index + 1;
                        final isSelected = selectedValue == number;
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: isSelected
                                  ? const Border(
                                top: BorderSide(
                                  color: Color(0xFFD7D7D7),
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: Color(0xFFD7D7D7),
                                  width: 1.0,
                                ),
                              )
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                '$number',
                                style: TextStyle(
                                  fontSize: isSelected ? 22.0 : 20.0,
                                  color: isSelected ? const Color(0xFF5A2BAF) : const Color(0xFFD8D7D7),
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  fontFamily: isSelected ? 'Poppins': 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 5,

                    ),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedValue = index + 1;
                      });
                    },
                  ),
                  Positioned(
                    right: 80.0,
                    child: Text(
                      selectedValue >= 2 && selectedValue <= 5 ? 'Portions' : 'Portion',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF5B5B5B),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(bottom: 180),
              child:
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

                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
