import 'package:flutter/material.dart';

import '../model/foods.dart';
import '../screens/food_detail.dart';

class FoodItem extends StatelessWidget {

  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
//  final Function removeFoodItem;


  FoodItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
//    @required this.removeFoodItem

  });



  //Todo: Using getter function to transform enum to output some text
  String get complexityText{
    switch(complexity){
      case Complexity.simple:
        return "Simple";
        break;

      case Complexity.challenging:
        return "Challenging";
        break;

      case Complexity.hard:
        return "Hard";
        break;

      default:
        return "Unknown";
    }

  }

  //Todo: Using getter function to transform enum to output some text
  String get affordabilityText{
    switch(affordability){
      case Affordability.affordable:
        return "Affordable";
        break;

      case Affordability.expensive:
        return "Expensive";
        break;

      case Affordability.luxurious:
        return "Luxurious";
        break;

      default:
        return "Unknown";
    }

  }

  void _displayItemDetails(BuildContext context){

    //Todo: Future objects allows to specify a function that should execute once their(future objects)
    //todo: operation is completed (e.g pushNamed)
    Navigator.of(context).pushNamed(

        FoodDetail.routeName,

        arguments:{
          'title': title,
          'imageUrl' : imageUrl
      }
      //Todo: Getting data passed to the pop method in (food_detail.dart)
      //Todo: Using then function to fetch the data once the future object(pushNamed) completes it's job
      //todo: (when page is popped)
    ).then((result){
      if(result!=null)
        print(result);
//       removeFoodItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _displayItemDetails(context);
      },
      child: Card(

        //Todo: Overriding the default shape of the card to a rounded rectangle border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),

        child: Column(
          children: <Widget>[

            //Todo: To display elements on top of eachother
            Stack(
              children: <Widget>[

                //TODO: 1. FOOD IMAGE

                //Todo: ClipRRect widget can transform any child into a certain form/shape
                //todo: Here can use Container for the same reason as well (for rounded corners)
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  ),


                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),


                //TODO: 2. FOOD INFORMATION

                //Todo: Positioned Widget allows to position a widget in absolute coordinate space
                //todo: like positioning in a website
                Positioned(
                  bottom: 20,
                  right: 18,

                  child: Container(
                    width: 350,
                    color: Colors.black54,

                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),

                      //Todo: softWrap is set to true, if the text is too long for the container then it gets wrapped
                      softWrap: true,

                      //Todo: overflow is set in the case if the text doesn't fit even after wrapping above
                      // todo: then fade it (cut it)
                      overflow: TextOverflow.fade,
                    ),
                  ),
              )
              ],
            ),

            //TODO: 3. MORE INFORMATION ABOUT FOOD

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      SizedBox(width: 5),
                      Text("$duration min"),
                      ],
                  ),

//                  SizedBox(width: 50),

                  Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 5),
                    Text(complexityText),
                      ],
                  ),

//                  SizedBox(width: 50),

                  Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(width: 5),
                      Text(affordabilityText),
                    ],
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