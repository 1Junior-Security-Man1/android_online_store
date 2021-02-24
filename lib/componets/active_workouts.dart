import 'package:android_online_store/componets/catalog.dart';
import 'package:android_online_store/componets/categories.dart';
import 'package:android_online_store/componets/item_card.dart';
import 'package:android_online_store/componets/item_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActiveWorkouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);
    final categoriesData = Provider.of<ProductDataProvider1>(context);
    //final categories = Provider.of<Categories>(context, listen: false);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: ListTile(
              title: Text ("В топе", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              //subtitle: Text("Боьше чем 100 видов напитков", style: TextStyle(fontSize: 16),
              ),
              //trailing: Icon(Icons.panorama_horizontal),
            ),
          Container(
            padding: const EdgeInsets.all(5.0),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productData.items.length,
              itemBuilder: (context, int index) => ChangeNotifierProvider.value(
                value: productData.items[index],
                child: ItemCard(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesData.items.length,
              itemBuilder: (context, int index) => ChangeNotifierProvider.value(
                value: categoriesData.items[index],
                child: ItemCategories(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
