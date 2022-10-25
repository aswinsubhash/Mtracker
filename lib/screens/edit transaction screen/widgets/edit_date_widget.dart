import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditDatePickWidget extends StatefulWidget {
  EditDatePickWidget({Key? key, required this.editDate}) : super(key: key);
  DateTime editDate;

  @override
  State<EditDatePickWidget> createState() => _EditDatePickWidgetState();
}

DateTime editedDate = DateTime.now();

class _EditDatePickWidgetState extends State<EditDatePickWidget> {
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.editDate,
      firstDate: DateTime(2020, 12),
      lastDate: DateTime(2100, 01),
      builder: (context, child) {
        //date picker theme
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(
                    255, 101, 209, 190), // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 254, 254, 254), // button  color
                ),
              ),
            ),
            child: child!);
      },
    );
    //dateselecting control statement
    if (picked != null && picked != widget.editDate) {
      setState(
        () {
          widget.editDate = picked;
          editedDate = widget.editDate;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    editedDate = widget.editDate;
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
                        '${widget.editDate.day} ${month[widget.editDate.month - 1]}',
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
