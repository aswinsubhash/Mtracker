import 'package:flutter/material.dart';

 DateTime selectedDate = DateTime.now();
class DatePick extends StatefulWidget {
  const DatePick({Key? key}) : super(key: key);

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
 
  List<String> month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  //date range fixed
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 12),
      lastDate: DateTime(2100, 01),
      builder: (context, child) {
        //date picker theme
        return Theme(data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255,101, 209, 190), // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 254, 254, 254), // button  color
            ),
          ),
        ), child: child!);
      },
    );

    //dateselecting control statement
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(
        () {
          selectedDate = pickedDate;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 201, 245, 235),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 101, 209, 190),
              child: Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 210,
              height: 60,
              child: TextButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        '${selectedDate.day} ${month[selectedDate.month - 1]}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 95, 94, 94),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
