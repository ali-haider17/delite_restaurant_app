import 'package:flutter/material.dart';

import '../model/foods.dart';
import '../widgets/food_item.dart';

//TODO: TO DISPLAY FAVOURITE FOODS HERE.

// todo: The favourite list will be handled in the main.dart file and passed using Tabs.
class Favourites extends StatelessWidget {

  final List<Foods> favouriteFoods;

  Favourites(
      this.favouriteFoods
      );

  @override
  Widget build(BuildContext context) {
    if(favouriteFoods.isEmpty)
      {
        return Center(
          child: Text("No Favourite Foods found!"),
        );
      }

    else{
      return ListView.builder(
          itemBuilder: (context, index){
            return FoodItem(
              title: favouriteFoods[index].title,
              imageUrl: favouriteFoods[index].imageUrl,
              duration: favouriteFoods[index].duration,
              complexity: favouriteFoods[index].complexity,
              affordability: favouriteFoods[index].affordability,

            );
          },
          itemCount: favouriteFoods.length
      );
    }
  }
}
