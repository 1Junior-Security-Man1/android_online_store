import 'dart:collection';
import 'package:flutter/foundation.dart';
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final color;
  final num price;

  Product(
      {@required this.price,
        @required this.id,
        @required this.title,
        @required this.description,
        @required this.imgUrl,
        @required this.color});
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Загородный  дом на квартиру!',
      description: '***',
      price: 200000,
      imgUrl:
      'https://costablancagrup.com/wp-content/uploads/2019/02/IMG_3471-1200x680.jpg',
      color: '0xF000000',
    ),
    Product(
      id: 'p1',
      title: 'Продам машину!',
      description: '***',
      price: 32000,
      imgUrl:
      'https://s0.rbk.ru/v6_top_pics/resized/1440xH/media/img/6/86/756026777651866.jpg',
      color: '0xF000000',
    ),
    Product(
      id: 'p2',
      title: 'Продаю собаку!',
      description: '***',
      price: 100,
      imgUrl:
      'https://lapki.pet/uploads/ad/850/preview/36be4682ae736a74157526b352f6bcb2.jpg',
      color: '0xF000000',
    ),
    Product(
      id: 'p4',
      title: 'Продаю кота!',
      description: '***',
      price: 20,
      imgUrl:
      'https://petstory.ru/resize/800x800x80/upload/images/articles/breeds/meyn-kun/maine_3.jpg',
      color: '0xF000000',
    ),
  ];
  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);
  getElementById(String id) => _items.singleWhere((value) => value.id == id);
}