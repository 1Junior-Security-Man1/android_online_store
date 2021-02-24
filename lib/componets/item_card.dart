import 'package:android_online_store/componets/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Container(
      width: 160,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
        color: Color(int.parse(product.color)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //       builder: (context) => ItemPage(productId: product.id)),
              // );
            },
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                      image: NetworkImage(product.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 83, left: 20),
                  child: Text(
                    "${product.title}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            //padding: EdgeInsets.only(bottom: 120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Text("${product.price}"),
                // IconButton(
                //     icon: Icon(Icons.add_circle_outline, color: Colors.black, size: 30,),
                //     // onPressed: () {
                //     //   Provider.of<CartDataProvider>(context, listen: false)
                //     //       .addItem(
                //     //     productId: product.id,
                //     //     price: product.price,
                //     //     title: product.title,
                //     //     imgUrl: product.imgUrl,
                //     //   );
                //     // }
                //     ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}