import 'package:duofinance/core/entities/spending_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SpendingList extends StatefulWidget {
  const SpendingList({
    super.key,
  });

  @override
  State<SpendingList> createState() => _SpendingListState();
}

class _SpendingListState extends State<SpendingList> {
  final List<Spending> spendings = <Spending>[
    Spending(id: 1, title: "Netflix", expected: 55, spent: 55),
    Spending(id: 2, title: "Aluguel", expected: 2000, spent: 2000),
    Spending(id: 3, title: "Amazon Prime", expected: 20, spent: 10),
    Spending(id: 4, title: "Mercado", expected: 600, spent: 824),
  ];

  handleReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Spending item = spendings.removeAt(oldIndex);
      spendings.insert(newIndex, item);
    });
  }

  handleRemoveItem(int index) {
    debugPrint('Remove item $index');
    // setState(() {
    //   _items.removeAt(index);
    // });
  }

  handleEditItem(int index) {
    debugPrint('Edit item $index');
  }

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: Colors.grey[850]!,
      ),
      clipBehavior: Clip.hardEdge,
      child: ReorderableListView.builder(
        itemCount: spendings.length,
        onReorder: (int oldIndex, int newIndex) {
          handleReorder(oldIndex, newIndex);
        },
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            key: ValueKey<int>(spendings[index].id),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: <SlidableAction>[
                SlidableAction(
                  onPressed: (BuildContext ctx) => handleEditItem(index),
                  icon: Icons.edit_rounded,
                  backgroundColor: Colors.cyan[200]!,
                ),
                SlidableAction(
                  onPressed: (BuildContext ctx) => handleRemoveItem(index),
                  icon: Icons.delete_rounded,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                  backgroundColor: Colors.red[300]!,
                ),
              ],
            ),
            child: listItem(item: spendings[index]),
          );
        },
      ),
    );
  }
}

Widget listItem({required Spending item}) => ListTile(
      leading: Icon(
        Icons.drag_indicator_rounded,
        size: 20,
        color: Colors.grey[600]!,
      ),
      horizontalTitleGap: 4,
      title: Text(item.title),
      subtitle: RichText(
        text: TextSpan(
          children: <TextSpan>[
            if (item.spent != item.expected) ...expectedValues(item),
            TextSpan(
              text: 'R\$ ${item.spent.toStringAsFixed(2)}',
              style: TextStyle(
                  color: item.spent <= item.expected
                      ? Colors.greenAccent
                      : Colors.red[400]!,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

List<TextSpan> expectedValues(Spending item) => <TextSpan>[
      TextSpan(
        text: 'Previsto: ',
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 12.0,
        ),
      ),
      TextSpan(
        text: 'R\$ ${item.expected.toStringAsFixed(2)}',
        style: TextStyle(
          color: Colors.cyan[100]!,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
        text: '  |  ',
        style: TextStyle(
          color: Colors.grey[600]!,
          fontSize: 12.0,
        ),
      ),
      TextSpan(
        text: 'Gasto: ',
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 12.0,
        ),
      ),
    ];
