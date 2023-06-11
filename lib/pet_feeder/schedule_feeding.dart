import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';

class ScheduleFeeding extends StatefulWidget {
  const ScheduleFeeding({Key? key}) : super(key: key);

  @override
  State<ScheduleFeeding> createState() => _ScheduleFeedingState();
}

class _ScheduleFeedingState extends State<ScheduleFeeding> {
  final List<DayInWeek> _days = [
    DayInWeek("Sun", dayKey: ''),
    DayInWeek("Mon", dayKey: ''),
    DayInWeek("Tue", isSelected: true, dayKey: ''),
    DayInWeek("Wed", dayKey: ''),
    DayInWeek("Thu", dayKey: ''),
    DayInWeek("Fri", dayKey: ''),
    DayInWeek("Sat", dayKey: ''),
  ];

  int _selectedPortion = 1;

  int selectedHour = 1;
  int selectedMinute = 00;
  String selectedPeriod = 'AM';

  List<int> hours = List<int>.generate(12, (index) => index + 1);
  List<int> minutes = List<int>.generate(60, (index) => index);
  List<String> periods = ['AM', 'PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF6),
      appBar: AppBar(
        title: const Text(
          'Schedule',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTimePicker(hours, selectedHour, (value) {
                    setState(() {
                      selectedHour = value;
                    });
                  }),
                  const Text(
                    ':',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xFF5A2BAF),
                    ),
                  ),
                  _buildTimePicker(minutes, selectedMinute, (value) {
                    setState(() {
                      selectedMinute = value;
                    });
                  }),
                  const SizedBox(width: 16.0),
                  _buildTimePicker(periods, selectedPeriod, (value) {
                    setState(() {
                      selectedPeriod = value;
                    });
                  }),
                ],
              ),
              const SizedBox(height: 25),
              DefaultTextStyle(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                child: SelectWeekDays(
                  days: _days,
                  backgroundColor: Colors.transparent,
                  daysFillColor: const Color(0xFFFFE9BC),
                  selectedDayTextColor: const Color(0xFF5C5C5C),
                  unSelectedDayTextColor: const Color(0xFF5C5C5C),
                  border: false,
                  onSelect: (values) {
                    (values);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 340, // Set desired width for the dropdown button
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE9BC),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Text(
                      'Portion',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 0),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerRight, // Align items to the right
                        children: [
                          DropdownButton<int>(
                            value: _selectedPortion,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedPortion = newValue!;
                              });
                            },
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 1,
                            dropdownColor: Colors.white,
                            items: List.generate(5, (index) {
                              final portion = index + 1;
                              return DropdownMenuItem<int>(
                                value: portion,
                                child: Text('$portion'),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 100),
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
                child: const Text('Save Schedule'),
              ),
            ],
          ),

        ),

      ),
    );
  }

  Widget _buildTimePicker(
      List<dynamic> items, dynamic selectedValue, Function(dynamic) onChanged) {
    return SizedBox(
      height: 250.0,
      width: 110.0,
      child: ListWheelScrollView(
        itemExtent: 50.0,
        physics: const FixedExtentScrollPhysics(),
        perspective: 0.001,
        children: items.map((item) {
          final isSelected = item == selectedValue;
          return Container(
            decoration: isSelected
                ? const BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: Color(0xFFD7D7D7),
                    width: 1.0,
                    style: BorderStyle.solid),
                bottom: BorderSide(
                    color: Color(0xFFD7D7D7),
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
            )
                : null,
            child: Center(
              child: Text(
                item is int
                    ? (items == minutes
                    ? item.toString().padLeft(2, '0')
                    : item.toString())
                    : item.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? const Color(0xFF5A2BAF) : const Color(0xFFD8D7D7),
                  fontFamily: isSelected ? 'Poppins' : 'Poppins',
                ),
              ),
            ),
          );
        }).toList(),
        onSelectedItemChanged: (index) {
          onChanged(items[index]);
        },
      ),
    );

  }

}
