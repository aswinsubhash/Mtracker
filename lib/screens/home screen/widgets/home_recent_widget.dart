import 'package:flutter/material.dart';

import '../../../db/model/trasaction_model.dart';

class HomeRecentWiidget extends StatefulWidget {
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

  HomeRecentWiidget({Key? key, required this.data}) : super(key: key);

  @override
  State<HomeRecentWiidget> createState() => _HomeRecentWiidgetState();
}

class _HomeRecentWiidgetState extends State<HomeRecentWiidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.data.length < 5 ? widget.data.length : 5,
      itemBuilder: (context, index) {
        final newList = widget.data.reversed;
        TransactionModel dataAtIndex;
        try {
          dataAtIndex = newList.elementAt(index);
        } catch (e) {
          return const SizedBox();
        }

        if (dataAtIndex.type == 'Income') {
          return incomeTileWiget(
            dataAtIndex.amount,
            dataAtIndex.category,
            dataAtIndex.date,
            dataAtIndex.type,
            index,
          );
        } else if (dataAtIndex.type == 'Expense') {
          return expenseTileWiget(
            dataAtIndex.amount,
            dataAtIndex.category,
            dataAtIndex.date,
            dataAtIndex.type,
            index,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  expenseTileWiget(
      int value, String category, DateTime date, String edittype, int index) {
    return Container(
      margin: const EdgeInsets.only(left: 1,top: 5,bottom: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[350],
      ),
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
                      Icons.keyboard_double_arrow_up_sharp,
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
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text('${date.day} ${widget.month[date.month - 1]}')
                        ],
                      ),
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
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(category)
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  incomeTileWiget(
      int value, String category, DateTime date, String edittype, int index) {
    return Container(
     margin: const EdgeInsets.only(left: 1,top: 5,bottom: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[350]),
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
                      Icons.keyboard_double_arrow_down_sharp,
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
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text('${date.day} ${widget.month[date.month - 1]}')
                        ],
                      ),
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
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(category)
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
