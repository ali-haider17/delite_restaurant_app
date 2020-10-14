import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import 'package:delite_restaurant/widgets/category_item.dart';


//Todo: To show meal categories

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Todo: Creating a grid of categories, using GridView to place items side by side
    //todo: GridView is scrollable by default as well
    return GridView(
      padding: const EdgeInsets.all(20),
      
      children: categoryList.map((cat){
        return CategoryItem(id: cat.id, name: cat.name, color: cat.color);
      }).toList(),

      //Todo: gridDelegate means that the folloing class (SliverGridDelegateWithMaxCrossAxisExtent)
      // todo: takes care of the structure and layout of the grid
      //Todo: Sliver means scrollable areas on the screen
      //Todo: WithMaxCrossAxisExtent is a preconfigured class that allows to define a max width
      // todo: for each item in the grid and create as many columns to fit items in the defined width

      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

        maxCrossAxisExtent: 200, // 200=Pixels

          //Todo: Defines how items should be sized according too their height and width
        childAspectRatio: 3/2, //i-e for 200 width have 300 height

          //Todo: Define the space between rows and columns
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,


      ),


    );
  }
}
