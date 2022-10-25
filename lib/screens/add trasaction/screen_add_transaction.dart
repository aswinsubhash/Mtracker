import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtracker/db/functions/db_helper.dart';
import 'package:mtracker/screens/add%20trasaction/widget/amount_add_widget.dart';
import 'package:mtracker/screens/add%20trasaction/widget/category_add_widget.dart';
import 'package:mtracker/screens/add%20trasaction/widget/date_pick.dart';
import 'package:mtracker/screens/add%20trasaction/widget/transaction_type_widget.dart';
import 'package:mtracker/screens/home%20screen/dash_screen.dart';
import 'package:mtracker/screens/home%20screen/widgets/common_widgets.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class ScreenAddTrasaction extends StatefulWidget {
  const ScreenAddTrasaction({Key? key}) : super(key: key);

  @override
  State<ScreenAddTrasaction> createState() => _ScreenAddTrasactionState();
}

String? category;
int? amount = 0;

class _ScreenAddTrasactionState extends State<ScreenAddTrasaction> {
  @override
  void initState() {
    categoryController = TextEditingController();
    amountController = TextEditingController();
    //category to variable
    categoryController.addListener(() {
      category = categoryController.text;
    });
    //amount  to variable
    amountController.addListener(() {
      amount = int.tryParse(amountController.text);
    });
    type = 'Income';
    super.initState();
  }

  @override
  void dispose() {
    categoryController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonSizedBox(40),
                  Text(
                    'Add Transaction',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  commonSizedBox(30),
                  const AddAmountWidget(),
                  commonSizedBox(30),
                  const AddCategoryWidget(),
                  commonSizedBox(20),
                  const TransactionType(),
                  commonSizedBox(20),
                  const DatePick(),
                  commonSizedBox(30),
                  ElevatedButton(
                    onPressed: () {
                      onButtonClick();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 101, 209, 190),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(150, 40),
                    ),
                    child: const Text('Add'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showError(BuildContext context) {
    AnimatedSnackBar.material(
      'Not all data provided',
      duration: const Duration(seconds: 5),
      type: AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition
          .bottom, // Position of snackbar on mobile devices
    ).show(context);
  }

  onButtonClick([bool mounted = true]) async {
    if (amount == 0 || category == null || amount == null || category == '') {
      showError(context);
    } else {
      DbHelper dbHelper = DbHelper();
      await dbHelper.addData(amount, selectedDate, category!, type);
      if (!mounted) return;
      AnimatedSnackBar.material(
        'Transaction added',
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
    }

    setState(() {
      amountController.clear();
      categoryController.clear();
    });
  }
}
