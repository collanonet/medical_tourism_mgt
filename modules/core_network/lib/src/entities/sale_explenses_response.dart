// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'explanses_item.dart';

part 'sale_explenses_response.g.dart';
@JsonSerializable()
class ExpensesResponse {
   @JsonKey(name: '_id')
  String id;
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

  ExpensesResponse({
    required this.id,
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

  factory ExpensesResponse.fromJson(Map<String, dynamic> json) => _$ExpensesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesResponseToJson(this);

}
