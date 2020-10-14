import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './screens/categories.dart';
import './screens/category_foods.dart';
import './screens/food_detail.dart';
import './screens/settings.dart';
import './screens/tabs.dart';
import './screens/tabs2.dart';

import './model/foods.dart';
import './data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

//Todo: Changed this stateless widget to stateful widget to set filter for Settings.dart
class _MyAppState extends State<MyApp> {

  //Todo: SETTINGS - Need to pass this Map to settings to get the default values set when state changes
  Map<String, bool> filters = {
    "vegan" : false,
    "lactose" : false,
  };

  List<Foods> availableFoods = foodsList;

  //Todo: FAVOURITES - Creating an empty favourite list to be passed to Tabs Screen (Home)
  List<Foods> favouriteFoods = [];

  //Todo: SETTINGS - This function is to be passed to the Settings() in Route Table
  void setFilters( Map<String, bool> filterData ) {

    setState(() {
      filters = filterData;
      print(filterData);

      if(filterData['vegan'] == true && filterData['lactose'] == false)
        {
          availableFoods = foodsList.where((food){
            return (food.isVegetarian == filters['vegan']);
          }).toList();
        }

      else if(filterData['lactose'] == true && filterData['vegan'] == false)
        {
          availableFoods = foodsList.where((food){
            return (food.isLactoseFree == filters['lactose']);
          }).toList();
        }

      else if(filterData['lactose'] == true && filterData['vegan'] == true)
      {
        availableFoods = foodsList.where((food){
          return (food.isLactoseFree == filters['lactose']) && (food.isVegetarian == filters['vegan']);
        }).toList();
      }

    });

  }


  //Todo: FAVOUTITES - Method to toggle favourites and add/remove from the favourites list
  //todo: Need to pass this function to FoodDetails to be used by floatingActionButton

  void toggleFavourites(String foodName)
  {
    //Todo: indexWhere method checks if a certain element is part of the list
    // todo: and automatically gives the index of that element, otherwise
    // todo: if it is not part gives -1.

    final existingIndex = favouriteFoods.indexWhere((food){
      return food.title == foodName;
    });

    if(existingIndex >= 0){
      setState(() {
        //Todo: Remove the element at the index if it is found already
        favouriteFoods.removeAt(existingIndex);
      });
    }

    else if(existingIndex < 0){
      setState(() {
        //Todo: Adding the element to the favourite list from the foodsList
        favouriteFoods.add(foodsList.firstWhere((food){
          return food.title == foodName;
        }));
      });
    }

  }


  //Todo: FAVOURITES - Creating a method to check if the Food is set to favourite or not
  //Todo: Need to pass this method to FoodDetails
  bool isFoodFavourite(String foodName){

    //Todo: any() method runs on every elements in the list and return true if the condition is met
    //todo: and stops checking
    return favouriteFoods.any((food){
      return food.title == foodName;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.black54,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontFamily: "RobotoCondensed", fontSize: 24),
          headline: TextStyle(fontFamily: "RobotoCondenses", fontSize: 28, fontWeight: FontWeight.bold)
        ),
      ),

      //Todo: HOME
      home: new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new Tabs2(favouriteFoods),

        title: new Text('Delite Restaurant',
          style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),),
        loadingText: Text("Loading...", style: TextStyle(color: Colors.white, fontSize: 18),),
        image: new Image.asset("assets/images/delite.png"),
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: Colors.amber,
      ),


      routes: {

        //Todo: Can also define the home page using '/' as identifier
//        '/': (ctx) => HomePage(),

//        '/category_foods': (ctx) => CategoryFoods(),

        //Todo: Can also store the route path above and use the syntax as follows:
        CategoryFoods.routeName : (ctx) => CategoryFoods(availableFoods),
        FoodDetail.routeName : (ctx) => FoodDetail(isFoodFavourite, toggleFavourites),
        Settings.routeName : (ctx) => Settings(filters ,setFilters),


      },

      //TODO: For future when some routes are being generated dynamically
      //todo: or if some unknow navigation occurs

      //Todo: onGenerateRoute takes a function that generates some route settings.
      //todo: and the function must return a route
      //todo: it gives access to settings of a route (e.g arguments)
      //todo: Executes for any unregistered named route
      onGenerateRoute: (settings){
        print(settings.arguments);

        //Todo: Can also find out the Name of route pushed using if condiitions and reture a MaterialPageRoute
//        if(settings.name == "/food_detail")
//          {
//            return MaterialPageRoute()
//          }

        //Todo: This route will be loaded by default for any route not registered in Route Table
        return MaterialPageRoute(builder: (ctx) =>  Tabs2(favouriteFoods)
        );
        },

      //Todo: onUnknownRoute is similar to the onGenerateRoute except for it is reached when
      //todo: Flutter is unable to build a screen with all the measures (e.g no valid navigation)
      //todo: to always show something on the screen
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) =>  Tabs2(favouriteFoods)
        );
      },


    );
  }
}

