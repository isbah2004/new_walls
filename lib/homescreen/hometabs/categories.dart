import 'package:flutter/material.dart';
import 'package:new_walls/categoryscreen/category_screen.dart';
import 'package:new_walls/reusablewidgets.dart/category_tile.dart';
import 'package:new_walls/viewmodel/constants.dart';
import 'package:new_walls/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModelProvider = Provider.of<ViewModel>(context);
    return GridView.builder(
      itemCount: viewModelProvider.homeList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        int placeholderIndex = index % Constants.placeholder.length;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CategoryTile(
            imageUrl: viewModelProvider.homeList[index].url.toString(),
            placeholder: Constants.placeholder[placeholderIndex].toString(),
            categoryName: Constants.categoryName[index].toString(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                    list: viewModelProvider.categoryLists[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
