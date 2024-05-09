

import 'package:flutter/material.dart';
import 'package:new_walls/models/api_model.dart';
import 'package:new_walls/reusablewidgets.dart/full_view_tile.dart';
import 'package:new_walls/viewmodel/constants.dart';

class CategoryScreen extends StatefulWidget {
  final List<ApiModel> list;
  const CategoryScreen({super.key, required this.list});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.builder(
          itemCount: widget.list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            int placeholderIndex = index % Constants.placeholder.length;
            return Hero(
              tag: widget.list[index].url.toString(),
              child: FullViewTile(
                imageUrl: widget.list[index].url.toString(),
                placeholder: Constants.placeholder[placeholderIndex].toString(),
              ),
            );
          },
        ),
      ),
      
    );
  }
}
