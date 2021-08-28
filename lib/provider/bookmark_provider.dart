import 'package:flutter/cupertino.dart';
import 'package:wishlist_app/models/items_model.dart';

class BookmarkBloc extends ChangeNotifier {
  int _count = 0;
  List<ItemModel> wishlist = [];
  void incrementCount() {
    _count++;
    notifyListeners();
  }

  int get count {
    return _count;
  }

  void addItems(ItemModel data) {
    // object of the ItemModel
    wishlist
        .add(data); // accessed from itemsModel list of type ItemModel class
    notifyListeners();
  }

  List<ItemModel> get itemsModel {
    return wishlist;
  }
}
