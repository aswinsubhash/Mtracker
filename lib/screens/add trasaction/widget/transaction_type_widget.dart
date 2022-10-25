import 'package:flutter/material.dart';

String type = 'Income';

class TransactionType extends StatefulWidget {
  const TransactionType({super.key});

  @override
  State<TransactionType> createState() => _TransactionTypeState();
}

class _TransactionTypeState extends State<TransactionType> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: SizedBox(
            width: 100,
            height: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 2),
              child: Text(
                'Income',
                style: TextStyle(
                  color: type == 'Income' ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
          selected: type == 'Income' ? true : false,
          selectedColor: const Color.fromARGB(255, 101, 209, 190),
          backgroundColor: const Color.fromARGB(255, 210, 210, 210),
          labelStyle: const TextStyle(color: Colors.white),
          onSelected: (val) {
            if (val) {
              setState(
                () {
                  type = 'Income';
                },
              );
            }
          },
        ),
        const SizedBox(
          width: 20,
        ),
        ChoiceChip(
          label: SizedBox(
            width: 100,
            height: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 2),
              child: Text(
                'Expense',
                style: TextStyle(
                    color: type == 'Expense' ? Colors.white : Colors.black54),
              ),
            ),
          ),
          selected: type == 'Expense' ? true : false,
          selectedColor: const Color.fromARGB(255, 101, 209, 190),
          backgroundColor: const Color.fromARGB(255, 210, 210, 210),
          labelStyle: const TextStyle(color: Colors.white),
          onSelected: (val) {
            setState(
              () {
                type = 'Expense';
              },
            );
          },
        )
      ],
    );
  }
}
