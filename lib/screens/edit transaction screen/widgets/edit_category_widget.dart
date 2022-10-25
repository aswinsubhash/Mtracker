import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditCategoryWidget extends StatefulWidget {
  const EditCategoryWidget({Key? key, required this.editCategory})
      : super(key: key);
  final String editCategory;

  @override
  State<EditCategoryWidget> createState() => _EditCategoryWidgetState();
}

String? editedCategory;
late TextEditingController editCategoryController;

class _EditCategoryWidgetState extends State<EditCategoryWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      editCategoryController.text = widget.editCategory;
    });
    super.initState();
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
                Icons.category,
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
                  controller: editCategoryController,
                  keyboardType: TextInputType.text,
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
    );
  }
}
