import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AddAmountWidget extends StatefulWidget {
  const AddAmountWidget({Key? key}) : super(key: key);

  @override
  State<AddAmountWidget> createState() => _AddAmountWidgetState();
}

late TextEditingController amountController;

class _AddAmountWidgetState extends State<AddAmountWidget> {
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
        child: Form(
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
                  //value passing
                  child: TextField(
                  inputFormatters: [
                     LengthLimitingTextInputFormatter(10),
                  ],
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.0),
                      hintText: 'Enter Amount',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
