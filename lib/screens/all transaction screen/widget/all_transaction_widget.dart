import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mtracker/db/functions/db_helper.dart';
import 'package:mtracker/db/model/trasaction_model.dart';
import 'package:mtracker/screens/all%20transaction%20screen/all_transaction_screen.dart';
import 'package:mtracker/screens/edit%20transaction%20screen/edit_transaction_screen.dart';
import 'package:mtracker/screens/home%20screen/dash_screen.dart';

class AllTransactionWidget extends StatefulWidget {
  final List<TransactionModel> data;
  final List<String> month = [
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
    'December'
  ];

  AllTransactionWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<AllTransactionWidget> createState() => _AllTransactionWidgetState();
}

DbHelper dbHelper = DbHelper();

class _AllTransactionWidgetState extends State<AllTransactionWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime todayFilter = DateTime.now();
    return ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          TransactionModel dataAtIndex;
          try {
            dataAtIndex = widget.data[index];
          } catch (e) {
            return const SizedBox();
          }

          // Income filteration starts  from  here

          if (dropDownValue == 'Income' && dataAtIndex.type == 'Income') {
            // Today's income transactions filteration

            if (dataFilterValue == 'Today') {
              if (dataAtIndex.date.month == todayFilter.month &&
                  dataAtIndex.date.day == todayFilter.day) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }

              // This month's income transactions filteration

            } else if (dataFilterValue == 'This Month') {
              if (dataAtIndex.date.month == todayFilter.month) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }

              // All income transactions filteration

            } else if (dataFilterValue == 'All') {
              return incomeTileWidget(
                dataAtIndex.amount,
                dataAtIndex.category,
                dataAtIndex.date,
                dataAtIndex.type,
                index,
              );

              // This year's income transactions filteration

            } else if (dataFilterValue == 'This Year') {
              if (yearFilterValue == 'January' && dataAtIndex.date.month == 1) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'February' &&
                  dataAtIndex.date.month == 2) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'March' &&
                  dataAtIndex.date.month == 3) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'April' &&
                  dataAtIndex.date.month == 4) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'May' &&
                  dataAtIndex.date.month == 5) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'June' &&
                  dataAtIndex.date.month == 6) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'July' &&
                  dataAtIndex.date.month == 7) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'August' &&
                  dataAtIndex.date.month == 8) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'September' &&
                  dataAtIndex.date.month == 9) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'October' &&
                  dataAtIndex.date.month == 10) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'November' &&
                  dataAtIndex.date.month == 11) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'December' &&
                  dataAtIndex.date.month == 12) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            }

            // Expense fileration starts from here

          } else if (dropDownValue == 'Expense' &&
              dataAtIndex.type == 'Expense') {
            // All expense transactions filteration

            if (dataFilterValue == 'All') {
              return expenseTileWidget(
                dataAtIndex.amount,
                dataAtIndex.category,
                dataAtIndex.date,
                dataAtIndex.type,
                index,
              );

              // Today's expense transactions filteration

            } else if (dataFilterValue == 'Today') {
              if (dataAtIndex.date.month == todayFilter.month &&
                  dataAtIndex.date.day == todayFilter.day) {
                return expenseTileWidget(
                  dataAtIndex.amount,
                  dataAtIndex.category,
                  dataAtIndex.date,
                  dataAtIndex.type,
                  index,
                );
              }

              // This month's expense transactions  filteration

            } else if (dataFilterValue == 'This Month') {
              if (dataAtIndex.date.month == todayFilter.month) {
                return expenseTileWidget(
                  dataAtIndex.amount,
                  dataAtIndex.category,
                  dataAtIndex.date,
                  dataAtIndex.type,
                  index,
                );
              }

              // This  year's expense transactions filteration

            } else if (dataFilterValue == 'This Year') {
              if (yearFilterValue == 'January' && dataAtIndex.date.month == 1) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'February' &&
                  dataAtIndex.date.month == 2) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'March' &&
                  dataAtIndex.date.month == 3) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'April' &&
                  dataAtIndex.date.month == 4) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'May' &&
                  dataAtIndex.date.month == 5) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'June' &&
                  dataAtIndex.date.month == 6) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'July' &&
                  dataAtIndex.date.month == 7) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'August' &&
                  dataAtIndex.date.month == 8) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'September' &&
                  dataAtIndex.date.month == 9) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'October' &&
                  dataAtIndex.date.month == 10) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'November' &&
                  dataAtIndex.date.month == 11) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'December' &&
                  dataAtIndex.date.month == 12) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            }
            // All type transactions filteration starts from here
            // Income data assigning

          } else {
            if (dropDownValue == 'All') {
              // Assigning datas to income tile according to the data transaction type

              if (dataAtIndex.type == 'Income') {
                // All income transactions data assigning to income tile according to the data filteration value 'All'

                if (dataFilterValue == 'All') {
                  return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index,
                  );

                  // All income transactions data assigning to income tile according to the data filteration type 'Today'

                } else if (dataFilterValue == 'Today') {
                  if (dataAtIndex.date.month == todayFilter.month &&
                      dataAtIndex.date.day == todayFilter.day) {
                    return incomeTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  }

                  // All income transactions datas assigning to income tile according to the data filteration type 'This Month'

                } else if (dataFilterValue == 'This Month') {
                  if (dataAtIndex.date.month == todayFilter.month) {
                    return incomeTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  }

                  // All income transactions datas assigning to income tile according to the data filteration type 'This Year'

                } else if (dataFilterValue == 'This Year') {
                  if (yearFilterValue == 'January' &&
                      dataAtIndex.date.month == 1) {
                    return incomeTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'February' &&
                      dataAtIndex.date.month == 2) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'March' &&
                      dataAtIndex.date.month == 3) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'April' &&
                      dataAtIndex.date.month == 4) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'May' &&
                      dataAtIndex.date.month == 5) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'June' &&
                      dataAtIndex.date.month == 6) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'July' &&
                      dataAtIndex.date.month == 7) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'August' &&
                      dataAtIndex.date.month == 8) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'September' &&
                      dataAtIndex.date.month == 9) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'October' &&
                      dataAtIndex.date.month == 10) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'November' &&
                      dataAtIndex.date.month == 11) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'December' &&
                      dataAtIndex.date.month == 12) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                }

                // Expense data assigning
                // Assigning datas to expense tile according to the data type

              } else {
                // All expense transactions data assigning to expense tile according to the data filteration value 'All'

                if (dataFilterValue == 'All') {
                  return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index,
                  );

                  // All expense transactions data assigning to expense tile according to the data filteration value 'Today'

                } else if (dataFilterValue == 'Today') {
                  if (dataAtIndex.date.month == todayFilter.month &&
                      dataAtIndex.date.day == todayFilter.day) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  }

                  // All expense transactions data assigning to expense tile according to the data filteration value 'This Month'

                } else if (dataFilterValue == 'This Month') {
                  if (dataAtIndex.date.month == todayFilter.month) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  }

                  // All expense  transactions data assigning to expense tile according to the data filteration value 'This Month'

                } else if (dataFilterValue == 'This Year') {
                  if (yearFilterValue == 'January' &&
                      dataAtIndex.date.month == 1) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'February' &&
                      dataAtIndex.date.month == 2) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'March' &&
                      dataAtIndex.date.month == 3) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'April' &&
                      dataAtIndex.date.month == 4) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'May' &&
                      dataAtIndex.date.month == 5) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'June' &&
                      dataAtIndex.date.month == 6) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'July' &&
                      dataAtIndex.date.month == 7) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'August' &&
                      dataAtIndex.date.month == 8) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'September' &&
                      dataAtIndex.date.month == 9) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'October' &&
                      dataAtIndex.date.month == 10) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'November' &&
                      dataAtIndex.date.month == 11) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  } else if (yearFilterValue == 'December' &&
                      dataAtIndex.date.month == 12) {
                    return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index,
                    );
                  }
                }
              }
            }
          }
          return const SizedBox();
        });
  }

  // Widget for expense

  expenseTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: (BuildContext context) {
              delete(context, index);
            },
            backgroundColor: const Color.fromARGB(255, 213, 20, 6),
            label: 'Delete',
            icon: Icons.delete,
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: (BuildContext context) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return ScreenEditTransaction(
                      amount: value,
                      category: category,
                      date: date,
                      editedType: edittype,
                      index: index,
                    );
                  },
                ),
              );
            },
            backgroundColor: const Color.fromARGB(255, 3, 161, 22),
            label: 'Edit',
            icon: Icons.edit,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 1, top: 5, bottom: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 23,
                      backgroundColor: Color.fromARGB(255, 244, 4, 4),
                      child: Icon(
                        Icons.keyboard_double_arrow_up_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Debit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('${date.day} ${widget.month[date.month - 1]}')
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '- ₹$value',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(category)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget for income

  incomeTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: (BuildContext context) {
              delete(context, index);
            },
            backgroundColor: const Color.fromARGB(255, 213, 20, 6),
            label: 'Delete',
            icon: Icons.delete,
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: (BuildContext context) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) {
                  return ScreenEditTransaction(
                    amount: value,
                    category: category,
                    date: date,
                    editedType: edittype,
                    index: index,
                  );
                }),
              );
            },
            backgroundColor: const Color.fromARGB(255, 3, 161, 22),
            label: 'Edit',
            icon: Icons.edit,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 1, top: 5, bottom: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.grey[350], borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 23,
                      backgroundColor: Color.fromARGB(255, 0, 204, 8),
                      child: Icon(
                        Icons.keyboard_double_arrow_down_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Credit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('${date.day} ${widget.month[date.month - 1]}')
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '+ ₹$value',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(category)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void delete(ctx, index) {
    showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you really want to delete this transaction?'),
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
