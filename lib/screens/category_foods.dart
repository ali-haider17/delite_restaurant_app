import 'package:flutter/material.dart';

import '../widgets/food_item.dart';
import '../model/foods.dart';
//Todo: Display a new page about category foods when a category is selected

class CategoryFoods extends StatefulWidget {

  static const routeName = "/category_foods";
  final List<Foods> availableFoods;

  CategoryFoods(this.availableFoods);

  @override
  _CategoryFoodsState createState() => _CategoryFoodsState();
}

class _CategoryFoodsState extends State<CategoryFoods> {

  String categoryName;
  List<Foods> categoryFood;

  var dataLoaded = false;

  //Todo: didChangeDependencies is a lifecycle that is triggered whenver the refernce of the state
  //todo: changes. It will be called when the widget belonging to the state is fully initialized.
  //todo: It will run before build runs so that the content is available.

  //todo: Also it runs a couple of times before initialization of the state (differ from initState)
  //todo: To stop it from re-running use a boolean value to check if it has run already.

  //Todo: Important didn't use initState because any context stuff won't work

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if(!dataLoaded) {
      //Todo: Using ModalRoute class to extract route arguments from the route
      //todo: get info about the route that was loaded
      //todo: here we are telling flutter that whatever arguments we get here will be of type Map
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
      categoryName = routeArgs['name'];
      final categoryId = routeArgs['id'];

      categoryFood = widget.availableFoods.where((category){
        return category.categoryId.contains(categoryId);
      }).toList();


      //Todo: set dataLoaded to true to make it run only once
      dataLoaded = true;
    }

    super.didChangeDependencies();
  }


  //Todo: A function to passed to the FoodItem to delete ann item when the page is popped
  //todo: also for this changed the Stateless to Stateful Widget
  void removeFoodItem(String foodTitle){
    print(foodTitle);
    setState(() {

      //Todo: removeWhere method will remove an item from the list where the condition is met true in the list
      categoryFood.removeWhere((food){
        return food.title == foodTitle;
      });
    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: ListView.builder(
          itemBuilder: (context, index){
             return FoodItem(
                 title: categoryFood[index].title,
                 imageUrl: categoryFood[index].imageUrl,
                 duration: categoryFood[index].duration,
                 complexity: categoryFood[index].complexity,
                 affordability: categoryFood[index].affordability,
//                 removeFoodItem: removeFoodItem,
             );
          },
          itemCount: categoryFood.length
      ),
    );
  }
}
