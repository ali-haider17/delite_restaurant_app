import 'package:flutter/material.dart';

import './categories.dart';
import './favourites.dart';
import '../model/foods.dart';

//TODO: (ONE WAY) DISPLAYING TABS AT THE BOTTOM OF THE APPBAR 

class Tabs extends StatefulWidget {

  final List<Foods> favouriteFoods;

  Tabs(
      this.favouriteFoods
      );


  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  @override
  Widget build(BuildContext context) {


    //Todo: One ways is Adding tabs on the bottom of AppBar
    //Todo: DefaultTabController takes Scaffold as a child

    //Todo: The DefaultTabController and TabBar are automatically connected by Flutter behind
    //todo: the scenes and DefaultTabController automatically detects which Tab has been selected in the TabBar
    //todo: and shows that Tab

    return DefaultTabController(
      //todo: length is to define the total number of tabs.
        length: 2,

        //Todo: To Set/Change the default TabBar to show
        initialIndex: 0, //0 for the first tab, 1 for the second ta and so on.......

        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Delite Restaurant",
              style: Theme.of(context).textTheme.title,
            ),

            //Todo: Using bottom argument to add TabBar Widget at the bottom
            bottom: TabBar(
                //todo: takes a list of Tab Widgets
                tabs: [
                  Tab(
                    icon: Icon(Icons.category),
                    child: Text("Category"),
                  ),

                  Tab(
                    icon: Icon(Icons.favorite),
                    child: Text("Favourites"),
                  )

            ]),
          ),

          //Todo: Using TabBarView to tell DefaultTabController which content to show for which Tab
          //Todo: Shows the First Tab content by default
          body: TabBarView(

            //Todo: Shows elements w.r.t the tabs above
              children: [

                //Todo: Shown as the the First Tab is selected
                Categories(),

                //Todo: Shown as the Second Tab is selected
                Favourites(widget.favouriteFoods),


          ]),


          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  onTap: (){

                  },
                  title: Text("Hello"),
                )
              ],
            ),
          ),
        )
    );
  }
}
