import 'package:flutter/material.dart';

import './side_drawer.dart';


//TODO: TO DISPLAY SWITCHES FOR VARIOUS FILTERS.

// todo: The filters will be handled in the main.dart file.

class Settings extends StatefulWidget {

  static const routeName = "/settings";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Settings(
      this.currentFilters,
      this.saveFilters
  );

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isVegetarian = false;
  bool isLactoseFree = false;

  //Todo: To initialize the current values when the state is created/loaded
  @override
  void initState() {
    // TODO: implement initState

    isVegetarian = widget.currentFilters['vegan'];
    isLactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),

        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                final selectedFilters = {
                  "vegan" : isVegetarian,
                  "lactose" : isLactoseFree
                };

                widget.saveFilters(selectedFilters);
              })
        ],
      ),

      drawer: SideDrawer(),

      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
              alignment: Alignment.center,
              child: Text(
                "Adjust settings for Foods Selection",
                style: TextStyle(fontSize: 20),
              ),
            ),

            //Todo: Expanded allows its child to take as much space as possible
            Expanded(
              child: ListView(
                children: [

                  //Todo: SwitchListTile widget allows to show a switch with some
                  // todo: additional text rather than a simple Switch

                  SwitchListTile(
                    title: Text("Vegetarian Food"),
                    subtitle: Text("Show only vegetarian foods."),

                    value: isVegetarian,

                    onChanged: (value){

                      setState(() {
                        isVegetarian = value;
                      });
//                      print(isVegetarian);
                    },

                    ),

                  SwitchListTile(
                    title: Text("Lactose-Free Food"),
                    subtitle: Text("Show only lactose-free foods."),

                    value: isLactoseFree,

                    onChanged: (value){
                      setState(() {
                        isLactoseFree = value;
                      });

//                      print(isLactoseFree);
                    },

                  ),
              ],
              ),
            )




          ],

        ),
      ),
    );
  }
}
