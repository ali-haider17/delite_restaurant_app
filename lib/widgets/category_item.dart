import 'package:flutter/material.dart';
import 'package:delite_restaurant/screens/category_foods.dart';

//Todo: Displays and renders a UI for each item passed to this class in the list

class CategoryItem extends StatelessWidget {

  final String id;
  final String name;
  final Color color;


  CategoryItem({
    @required this.id,
    this.name,
    this.color,
  });


  //Todo: To navigate to another page on tap

  void _displayCategoryFoods (BuildContext context){

    //Todo: Navigator class helps in navigating beteen screens/pages
//    Navigator.of(context).push(MaterialPageRoute(builder: (context){
//      return CategoryFoods(name);
//    }));

    Navigator.of(context).pushNamed(
      //pushnamed takes the route identifies
      '/category_foods',

      //passing arguments to the route
      arguments: {
        'name': name,
        'color': color,
        'id' : id
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    //Todo: GESTURE DETECTOR is one of the most important Widget that detects gestures on a widget(eg Container)
    //todo: Need a widget to be clickable and call a function on Tap use Gesture Detector
    
    //Todo: INKWELL widget is also a gesture detector which provides a ripple effect 
    return InkWell(

      onTap: (){
        _displayCategoryFoods(context);
      },
      
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      
      child: Container(

        padding: const EdgeInsets.all(20),
        child: Text(name),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              //Todo: Begin and End to set the direction of the gradient.
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            colors: [

              //Todo: withOpacity method on color provides transparency to the color
              color.withOpacity(0.7),
              color
            ]),

          //Todo: to round off the corners of the container
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
