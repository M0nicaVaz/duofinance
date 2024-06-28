import 'package:duofinance/core/entities/spending_entity.dart';
import 'package:duofinance/features/dashboard/widgets/spending_item.dart';
import 'package:duofinance/widgets/dialog.dart';
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
    Spending(id: 1, title: "Energia", expected: 200, spent: 158),
    Spending(id: 5, title: "Netflix", expected: 55, spent: 55),
    Spending(id: 2, title: "Aluguel", expected: 2000, spent: 2000),
    Spending(id: 4, title: "Mercado", expected: 600, spent: 824),
    Spending(id: 3, title: "Amazon Prime", expected: 20, spent: 10),
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

  handleEditItem(BuildContext context, int index) {
    showAddDialog(
      context: context,
      title: spendings[index].title,
      expectedValue: spendings[index].expected.toString(),
      spentValue: spendings[index].spent.toString(),
    );
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
        proxyDecorator: (Widget child, int index, Animation<double> animation) {
          return Material(
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            color: Colors.cyanAccent.withOpacity(0.2),
            child: ScaleTransition(
              scale: animation.drive(
                Tween<double>(begin: 1, end: 1.05).chain(
                  CurveTween(curve: Curves.bounceInOut),
                ),
              ),
              child: child,
            ),
          );
        },
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
                  onPressed: (BuildContext ctx) => handleEditItem(ctx, index),
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
            child: ListItem(item: spendings[index]),
          );
        },
      ),
    );
  }
}
