import 'package:flutter/material.dart';
import 'package:friutes/provider/provider_page.dart';
import 'package:provider/provider.dart';
import 'package:friutes/provider/provider_page.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {


  @override
  Widget build(BuildContext context) {
    final object=Provider.of<Provider_class>(context);
    List name=object.favoriteName;
    List image=object.favoriteImage;

    return Scaffold(
      appBar: AppBar(title: const Text("Wish List",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,),
      body:
      ListView.builder(
          itemCount: name.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading:CircleAvatar(
                  backgroundImage: AssetImage(image[index]),
                  radius: 30,),
                title: Text(name[index],style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: IconButton(
                  onPressed: (){
                    object.favorites(name[index],image[index]);
                  },
                  icon: object.icn_change(name[index])?Icon(Icons.favorite,color: Colors.red,):
                  Icon(Icons.favorite_border,color: Colors.blue,),
                ),

              ),
            );


          }),
    );
  }
}