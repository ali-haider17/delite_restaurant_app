import 'package:flutter/material.dart';
import './settings.dart';

//TODO: PROBLEM
//Todo: Infinitely growing stack. Need a way to stop pushing page routes on top of one-another
//todo: on the stack and clear the stack. Only to push new page route as the only page route on stack.

//TODO: SOLUTION
//Todo: Using pushReplacementNamed and pushNamed which delete the previous route as a new one is pushed4


class SideDrawer extends StatelessWidget {

  void _displayFoods(BuildContext context){
//    Navigator.of(context).pushNamed("/");

    //Todo: pushReplacementNamed replaces the existing page with the new page.
    // todo: Also, don't get a back button as no previous pages on stack.
    //Todo: pushNamed just pushes the new page on to the stack. Get a back button by default.

    Navigator.of(context).pushReplacementNamed("/");

  }

  void _displayFilterFoods(BuildContext context){
//    Navigator.of(context).pushNamed(
//      Settings.routeName
//    );

    Navigator.of(context).pushReplacementNamed(
      Settings.routeName
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(
                color: Colors.amberAccent,
                width: 10
              )
            ),
            child: Text("Delite Restaurant",
                style: Theme.of(context).textTheme.headline),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 40),
            width: double.infinity,
            alignment: Alignment.center,
            height: 100,

          ),

          Divider(color: Colors.cyan,),
          SizedBox(
            height: 10,
          ),


          ListTile(
            onTap: () {
              _displayFoods(context);
            },
            leading: Icon(Icons.restaurant,),
            title: Text("Foods", style: TextStyle(fontSize: 20),),
          ),


          ListTile(
            onTap: () {
              _displayFilterFoods(context);
            },
            leading: Icon(Icons.settings,),
            title: Text("Settings", style: TextStyle(fontSize: 20),),
          ),

        ],
      ),
    );
  }
}
