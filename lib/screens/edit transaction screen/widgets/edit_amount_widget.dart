import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditAmountWidget extends StatefulWidget {
  const EditAmountWidget({Key? key, required this.editAmount})
      : super(key: key);
  final int editAmount;

  @override
  State<EditAmountWidget> createState() => _EditAmountWidgetState();
}

int? editedAmount;
late TextEditingController editAmountController;

class _EditAmountWidgetState extends State<EditAmountWidget> {
  @override
  Widget build(BuildContext context) {
    editAmountController.text = widget.editAmount.toString();
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
                Icons.currency_rupee,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 210,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                    inputFormatters: [
                     LengthLimitingTextInputFormatter(10),
                  ],
                  controller: editAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.0),
                    hintText: 'Enter Amount',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
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
