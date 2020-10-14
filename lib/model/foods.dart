import 'package:flutter/material.dart';

//Todo: enum is a type that helps to create a choice amongst some alternatives
//Todo: Creating a custom enum for complexity level

enum Complexity{
    //Todo: The following values(labels) are mapped as integers (0,1,2 ...)
  simple,
  challenging,
  hard
}


enum Affordability{
  affordable,
  expensive,
  luxurious

}

class Foods{

  final String id;
  final List<String> categoryId;
  final String title;

  //Todo: Use a Network image, stored on some server
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;

  //Todo: Using the above enum type
  final Complexity complexity;
  final Affordability affordability;
  final bool isLactoseFree;
  final bool isVegetarian;

  const Foods({
    @required this.id,
    @required this.categoryId,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isLactoseFree,
    @required this.isVegetarian
  });


}