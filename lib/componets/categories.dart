import 'dart:collection';
import 'package:flutter/foundation.dart';
class Categories with ChangeNotifier {
  final String id;
  final String title;
  final String imgUrl;
  final color;

  Categories({
        @required this.id,
        @required this.title,
        @required this.imgUrl,
        @required this.color});
}

class ProductDataProvider1 with ChangeNotifier {
  List<Categories> _items = [
    Categories(
      id: 'p3',
      title: 'Животные',
      imgUrl:
      'https://image.flaticon.com/icons/png/512/35/35096.png',
      color: '0xF000000',
    ),
    Categories(
      id: 'p1',
      title: 'Машины',
      imgUrl:
      'https://image.freepik.com/free-icon/car-symbol-2_318-10292.jpg',
      color: '0xF000000',
    ),
    Categories(
      id: 'p2',
      title: 'Квартиры',
      imgUrl:
      'https://image.flaticon.com/icons/png/512/86/86329.png',
      color: '0xF000000',
    ),
    Categories(
      id: 'p4',
      title: 'Инвентарь',
      imgUrl:
      'https://w7.pngwing.com/pngs/147/480/png-transparent-computer-icons-sport-indiana-fitness-club-fitness-centre-dumbbell-dumbbell-icon-angle-hand-logo.png',
      color: '0xF000000',
    ),
  ];
  UnmodifiableListView<Categories> get items => UnmodifiableListView(_items);
  getElementById(String id) => _items.singleWhere((value) => value.id == id);
}