import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtracker/screens/home%20screen/widgets/common_widgets.dart';

class BalanceCard extends StatefulWidget {
 final int totalBalance;
 final int totalIncome;
 final int totalExpense;

 const BalanceCard(
      {Key? key,
      required this.totalBalance,
      required this.totalIncome,
      required this.totalExpense})
      : super(key: key);

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 101, 209, 190),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          commonSizedBox(30),
        widget.totalBalance < 0 ?   Text(
            'Total Due',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ):  Text(
            'Total Balance',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
          commonSizedBox(3),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: AutoSizeText(
              ' ₹ ${widget.totalBalance }',
              maxLines: 1,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        child: Icon(
                          Icons.keyboard_double_arrow_up_rounded,
                          color: Color.fromARGB(255, 18, 233, 26),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Income',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          AutoSizeText(
                            '₹ ${widget.totalIncome}',
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        child: Icon(
                          Icons.keyboard_double_arrow_down,
                          color: Color.fromARGB(255, 245, 6, 6),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Expense',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            '₹ ${widget.totalExpense}',
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
