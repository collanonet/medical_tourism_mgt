import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaleModel{
 
  ValueNotifier<List<Items>> itemData = ValueNotifier([
    Items(item: '通訳'),
    Items(item: '1-B 割引（貴社にて東京国際大堀病院に初回連絡済のため）'),
    Items(item: '1-C 紹介手数料　15％'),
    Items(item: '2-A 医療通訳者費用：1日6時間以内'),
    Items(item: '2-B 医療通訳者費用：半日3時間以内'),
    Items(item: '2-C 医療通訳者費用：入院付き添い'),
  ]);

  ValueNotifier<List<Unit>> unitData = ValueNotifier([
    Unit(item: '人'),
    Unit(item: '式'),
    Unit(item: '日'),
    Unit(item: '回'),
  ]);

  ValueNotifier<List<Tax>> taxData = ValueNotifier([
    Tax(tax: '内税'),
     Tax(tax: '外税'),
      Tax(tax: '非課税'),

  ]);

  ValueNotifier<List<SubmitItem>> submitData = ValueNotifier([
    SubmitItem(item: 'ここにテキストが入ります'),
    SubmitItem(item: '1月2日半日分'),
    SubmitItem(item: '1月3日半日分'),
    SubmitItem(item: '自由入力できます'),
    SubmitItem(item: 'ここにテキストが入ります'),
    
  ]);
}

class Items{
  String item;

  Items({required this.item});
}

class Unit{
  String item;
  Unit({required this.item});
}

class Tax{
  String tax;
  Tax({required this.tax});
}

class SubmitItem{
  String item;
  SubmitItem({required this.item});
}