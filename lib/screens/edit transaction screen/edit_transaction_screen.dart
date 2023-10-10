import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../db/functions/db_helper.dart';
import '../add%20trasaction/widget/transaction_type_widget.dart';
import '../edit%20transaction%20screen/widgets/edit_amount_widget.dart';
import '../edit%20transaction%20screen/widgets/edit_category_widget.dart';
import '../edit%20transaction%20screen/widgets/edit_date_widget.dart';
import '../home%20screen/dash_screen.dart';
import '../home%20screen/widgets/common_widgets.dart';

class ScreenEditTransaction extends StatefulWidget {
  const ScreenEditTransaction(
      {Key? key,
      required this.amount,
      required this.category,
      required this.date,
      required this.editedType,
      required this.index})
      : super(key: key);

  final int amount;
  final String category;
  final DateTime date;
  final String editedType;
  final int index;

  @override
  State<ScreenEditTransaction> createState() => _ScreenEditTransactionState();
}

class _ScreenEditTransactionState extends State<ScreenEditTransaction> {
  DbHelper dbHelper = DbHelper();
  @override
  void initState() {
    editAmountController = TextEditingController();
    editCategoryController = TextEditingController();

    editAmountController.addListener(() {
      editedAmount = int.tryParse(editAmountController.text);
    });

    editCategoryController.addListener(() {
      editedCategory = editCategoryController.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    type = widget.editedType;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                delete(context, widget.index);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonSizedBox(40),
                  Text(
                    'Edit Transaction',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  commonSizedBox(30),
                  EditAmountWidget(editAmount: widget.amount),
                  commonSizedBox(30),
                  EditCategoryWidget(editCategory: widget.category),
                  commonSizedBox(20),
                  const TransactionType(),
                  commonSizedBox(20),
                  EditDatePickWidget(editDate: widget.date),
                  commonSizedBox(20),
                  ElevatedButton(
                    onPressed: () {
                      onButtonClick();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 101, 209, 190),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(15, 40)),
                    child: const Text('Update'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Not all data provided'),
        backgroundColor: Color.fromARGB(255, 230, 23, 8),
      ),
    );
  }

  onButtonClick([bool mounted = true]) async {
    if (editedCategory == null ||
        editedAmount == 0 ||
        editedAmount == null ||
        editedCategory == '') {
      showError(context);
    } else {
      DbHelper dbHelper = DbHelper();
      await dbHelper.updateData(
        editedAmount,
        editedDate,
        editedCategory!,
        type,
        widget.index,
      );
      if (widget.amount != editedAmount ||
          widget.category != editedCategory ||
          widget.date != editedDate ||
          type != widget.editedType) {
        if (!mounted) return;
        AnimatedSnackBar.material(
          'Transaction updated',
          duration: const Duration(seconds: 5),
          type: AnimatedSnackBarType.success,
          mobileSnackBarPosition: MobileSnackBarPosition
              .bottom, // Position of snackbar on mobile devices
        ).show(context);
        if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx3) {
        return const DashScreen();
      }), (route) => false); 
      } else {
        if (!mounted) return;
        AnimatedSnackBar.material(
          'No change in transaction',
          duration: const Duration(seconds: 5),
          type: AnimatedSnackBarType.info,
          mobileSnackBarPosition: MobileSnackBarPosition
              .bottom, // Position of snackbar on mobile devices
        ).show(context);
        if (!mounted) return;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashScreen()));
      }
    }
  }

  void delete(ctx, index) {
    showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Do you really want to delete this transaction?',
            style: TextStyle(
              height: 1.5
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                dbHelper.deleteData(index);
                AnimatedSnackBar.material(
                  'Transaction deleted',
                  duration: const Duration(seconds: 5),
                  type: AnimatedSnackBarType.error,
                  mobileSnackBarPosition: MobileSnackBarPosition
                      .bottom, // Position of snackbar on mobile devices
                ).show(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashScreen()));
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Color.fromARGB(255, 101, 209, 190),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx1).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(
                  color: Color.fromARGB(255, 101, 209, 190),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
