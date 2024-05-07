import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_walls/reusablewidgets.dart/full_view_tile.dart';
import 'package:new_walls/viewmodel/constants.dart';
import 'package:new_walls/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

class RandomTab extends StatelessWidget {
  const RandomTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModelProvider = Provider.of<ViewModel>(context);
    viewModelProvider.combinedList.shuffle(Random());
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView.builder(
        itemCount: viewModelProvider.combinedList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          int placeholderIndex = index % Constants.placeholder.length;
          return Hero(
            tag: viewModelProvider.combinedList[index].url.toString(),
            child: FullViewTile(
              imageUrl: viewModelProvider.combinedList[index].url.toString(),
              placeholder: Constants.placeholder[placeholderIndex].toString(),
            ),
          );
        },
      ),
    );
  }
}
