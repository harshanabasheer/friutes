import 'package:flutter/material.dart';
import 'package:friutes/favorite.dart';
import 'package:friutes/model/friutes_model.dart';
import 'package:provider/provider.dart';
// import 'package:providerwords/favorite.dart';
import 'package:friutes/provider/provider_page.dart';
// import 'package:listview/image.dart';
// import 'package:listview/model/listmodel.dart';

class FruitesProvider extends StatefulWidget {
  const FruitesProvider({super.key});

  @override
  State<FruitesProvider> createState() => _FruitesProviderState();
}

class _FruitesProviderState extends State<FruitesProvider> {

  @override
  Widget build(BuildContext context) {
    List items =[
      FruitModel(text1: "Apple",text2:"Kg\n\$20",img: 'images/apple.jpg'),
      FruitModel(text1: "Banana",text2:"DoZ\n\$10",img: 'images/banana.jpeg'),
      FruitModel(text1: "Grape",text2:"Doz\n\$10",img: 'images/grape.jpeg'),
      FruitModel(text1: "Kiwi",text2:"Kg\n\$20",img: 'images/kiwi.jpeg'),
      FruitModel(text1: "Mango",text2:"Kg\n\$20",img: 'images/mango.jpg'),
      FruitModel(text1: "Orange",text2:"Doz\n\$10",img: 'images/orange.jpeg'),
      FruitModel(text1: "Peach",text2:"Doz\n\$10",img: 'images/peach.jpeg'),
      FruitModel(text1: "Watermelon",text2:"Kg\n\$20",img: 'images/watermelon.jpeg'),
    ];

    final object= Provider.of<Provider_class>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Text("Fruits", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoriteList()));
                },
                icon: Icon(Icons.add_shopping_cart, color: Colors.white, size: 40.0,),
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Text(object.favoriteImage.length.toString(), style: TextStyle(color: Colors.white, fontSize: 10,)),
                ),
              ),
            ],
          ),
        ],
      ),

        body:
      ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading:CircleAvatar(
                   backgroundImage: AssetImage(items[index].img,),
                    radius: 30,),
                  title: Text(items[index].text1,style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle:Text(items[index].text2),
                  trailing:ElevatedButton(
                    onPressed: () {
                      object.favorites(items[index].text1,items[index].img);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black45, // Background color
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 15,color: Colors.white),
                    ),
                  ),

                ),
              ),
            );


          }),
    );
  }
}