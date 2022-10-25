import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCategoryWidget extends StatefulWidget {
  const AddCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCategoryWidget> createState() => _AddCategoryWidgetState();
}

late TextEditingController categoryController;

class _AddCategoryWidgetState extends State<AddCategoryWidget> {
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
                  Icons.category,
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
                    controller: categoryController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.0),
                      hintText: 'Category',
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
