import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

//Todo: To be displayed when a food item is tapped.

class FoodDetail extends StatelessWidget {

  static const routeName = "/food_detail";

  //Todo: Fetching function to use it in the floating action button
  final Function toggleFavourites;
  final Function isFoodFavourite;
  FoodDetail(this.isFoodFavourite, this.toggleFavourites);

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final String title = routeArgs['title'];
    final String imageUrl = routeArgs['imageUrl'];

//    final foodItem = foodsList.where((food){
//      return food.title.contains(title);
//    }).toList();

    //Todo: Can also use firstWhere() method to get only one fitting element rather than
    //todo: using Where() to get a couple of fitting elements.

    final foodItem = foodsList.firstWhere((food){
      return food.title == title;
    });
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              child: Column(
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.all(10),
                      child: Text("Ingredients", style: TextStyle(fontSize: 24),)
                  ),

                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    height: 150,
                    width: 300,
                    child: ListView.builder(
                        itemBuilder: (context, index){
                          return Card(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                foodItem.ingredients[index],
                                style: TextStyle(
                                  fontSize: 18
                                ),

                              ),
                            ),
                          );
                        },
                        itemCount: foodItem.ingredients.length
                    ),
                  ),


                  SizedBox(
                    height: 10,
                  ),

                  Container(
                      margin: EdgeInsets.all(10),
                      child: Text("Steps", style: TextStyle(fontSize: 24),)
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    height: 250,
                    width: 300,
                    child: ListView.builder(
                        itemBuilder: (context, index){
                          return Column(
                            children: <Widget>[
                              ListTile(
                                  leading: CircleAvatar(
                                    child: Text("${index + 1}"),
                                  ),
                                title: Text(foodItem.steps[index]),

                              ),

                              //Todo: Divider Widget adds like a line between elements
                              Divider(color: Colors.grey,),
                            ],
                          );
                        },
                        itemCount: foodItem.steps.length

                    ),
                  ),



                ],
              ),
            )

          ],
        ),
      ),

//      //TODO: Popping pages and passing any data with it
//
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.delete),
//        onPressed: (){
//
//          Navigator.of(context).pop(
//          //todo: passing title value at pop
//            title,
//            //todo: To get this value go to the class from which the route for this apage was pushed
//            //todo: (e.g food_item.dart))
//          );
//
//          //todo can also use popAndPushNamed to pop the current page and push a new page
//        },
//      ),



    floatingActionButton: FloatingActionButton(
      child: Icon(
        //todo: Checking if the current food item is favourite or nnot
        isFoodFavourite(title) ? Icons.favorite : Icons.favorite_border
      ),
      backgroundColor: Colors.redAccent,
      elevation: 10,
      onPressed: (){
        toggleFavourites(title);
      },
    ),

    );
  }
}

