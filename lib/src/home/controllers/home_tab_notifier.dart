import 'package:fashion_app/common/utils/enums.dart';
import 'package:flutter/material.dart';

class hometabnotofier with ChangeNotifier {
  QueryType querytype = QueryType.all;
  String _index = "All";
  //List<String> hometab = ["All", "popular", "Unisex", "Men", "Women", "kid"];

  String get index => _index;

  void setindex(String index) {
    _index = index;

    switch (index) {
      case "All":
        setqueryType(QueryType.all);
        break;
      case "popular":
        setqueryType(QueryType.popular);
        break;
      case "Unisex":
        setqueryType(QueryType.unisex);
        break;
      case "Men":
        setqueryType(QueryType.men);
        break;
      case "Women":
        setqueryType(QueryType.women);
        break;
      case "kid":
        setqueryType(QueryType.kids);
        break;

      default:
        setqueryType(QueryType.all);
    }

    notifyListeners();
  }

  void setqueryType(QueryType q) {
    querytype = q;
    print(q.name);
  }
}
