import 'package:flutter/material.dart';

import './side_drawer.dart';
import './categories.dart';
import './favourites.dart';
import '../model/foods.dart';

//TODO: (SECOND WAY) DISPLAYING TABS AT THE BOTTOM OF THE PAGE

//Todo: Major difference between (TabBars at the bottom of AppBar) and (Tabs at the bottom) is that
//todo: here we need to manually control what the user selects and which content to display.


class Tabs2 extends StatefulWidget {

  final List<Foods> favouriteFoods;

  Tabs2(
      this.favouriteFoods
      );

  @override
  _Tabs2State createState() => _Tabs2State();

}

class _Tabs2State extends State<Tabs2> {

  int pageIndex = 0;

  void _displayTab(int index){
    print(index);
    setState(() {
      pageIndex = index;
    });
  }

  //Todo: Defining a List of Widgets
//  final List<Widget> pages = [
//    Categories(),
//    Favourites()
//  ];


  //Todo: Can also define a List of map of Widget with some additional values
  List<Map<String,Object>> pages;

  //Todo: IMPORTANT - Widget property is only to be used in initState and build method.

  @override
  void initState() {
    // TODO: implement initState

    pages = [
    {'page' : Categories(), 'title' : "Food Categories" },
    {'page' : Favourites(widget.favouriteFoods), 'title' : "Favourite Foods"},
    ];


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              pages[pageIndex]['title'],
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
        ),
            //Todo: Using bottom argument to add TabBar Widget at the bottom

      drawer: SideDrawer(),

        //Todo: Displaying the page according to the pageIndex set.
//        body: pages[pageIndex],

        //Todo: Displaying the page according to the pageIndex set (Using a list of map).
          body: pages[pageIndex]['page'],

        //Todo: Using the bottomNavigationBar Widget with onTap listener for manual setting
        bottomNavigationBar: BottomNavigationBar(

          unselectedItemColor: Theme.of(context).accentColor,
          selectedItemColor: Colors.white70,

          //Todo: CurrentIndex tells BottomNavigationBar which tab is currently selected and apply
          //todo: styling on the selected item.
          currentIndex: pageIndex,

          //Todo: Adding effect on tap using the Type Argument
//          type: BottomNavigationBarType.shifting,

          onTap: (int){
            _displayTab(int);
          },

          backgroundColor: Theme.of(context).primaryColor,
          elevation: 5,

          //Todo: Items must be bottomNavigationBarItems (tasks)
          items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  title: Text("Category"),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text("Favourites"),
              )
          ],

        ),
    );
  }
}
