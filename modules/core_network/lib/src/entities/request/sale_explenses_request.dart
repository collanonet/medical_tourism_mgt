// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'sale_explenses_request.g.dart';
@JsonSerializable()
class ExpensesRequest {
  String? majorItems;
  List<Subitem>? subitems;
  int? quantity;
  String? unit;
  int? unitPrice;
  int? amountOfMoney;
  int? paymentDocument;
  int? totalExpenses;
  int? totalExpensesTax;
  int? totalExpensesAmount;
  String? typeOfTax;

  ExpensesRequest({
    this.majorItems,
    this.subitems,
    this.quantity,
    this.unit,
    this.unitPrice,
    this.amountOfMoney,
    this.paymentDocument,
    this.totalExpenses,
    this.totalExpensesTax,
    this.totalExpensesAmount,
    this.typeOfTax,
  });
  factory ExpensesRequest.fromJson(Map<String, dynamic> json) => _$ExpensesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesRequestToJson(this);

}

@JsonSerializable()
class Subitem {
  String? submit;

  Subitem({this.submit});
  factory Subitem.fromJson(Map<String, dynamic> json) => _$SubitemFromJson(json);
  Map<String, dynamic> toJson() => _$SubitemToJson(this);
}
