import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info/models/CategoryItem.dart';

class Category extends StatelessWidget {
  final CategoryItem categoryItem;
  final Function onTap;
  final int index;
  final bool isSelected;

  Category({this.categoryItem, this.onTap, this.index, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  categoryItem.iconData,
                  color: Colors.black,
                ),
                if (isSelected)
                  SizedBox(
                    width: 10,
                  ),
                if (isSelected)
                  Text(
                    categoryItem.title,
                    style: TextStyle(color: Colors.black),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
