// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_sale/data_sale.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class SaleModel {
  SaleModel({required this.saleRepository});
  final SaleRepository saleRepository;
 
  Future<void> fetchData(FormGroup formGroup) async{
    try{
      await fetchHeadData(formGroup.control('head_info') as FormGroup);
      await fetchServiceFree(formGroup.control('service_fee') as FormGroup);
      await fetchExpenses(formGroup.control('expenses') as FormGroup);
      await fetchTotal(formGroup.control('total') as FormGroup);

    }catch(e){
      logger.d(e);
    }
  }
  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());
  Future<void> submitDataInfo(FormGroup formGroup) async {
      try{
        submit.value = const AsyncData(loading: true);
        await submitHeadInfo(formGroup.control('head_info') as FormGroup);
        await submitServiceFree(formGroup.control('service_fee') as FormGroup);
        await submitExpenses(formGroup.control('expenses') as FormGroup);
        await submitTotal(formGroup.control('total') as FormGroup);
        submit.value = const AsyncData(loading: false);
      }catch(e){
        logger.d(e);
      }
  }
   ValueNotifier<AsyncData<HeadInfoResponse>> saleHeadInfoData = ValueNotifier(const AsyncData());
  Future<void> fetchHeadData(FormGroup formGroup) async{
    try{
      saleHeadInfoData.value = const AsyncData(loading: true);
      final response = await saleRepository.getHeadInfo();
      insertHeadInfo(formGroup, response);
      saleHeadInfoData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
    }
  }
  void insertHeadInfo(FormGroup formGroup, HeadInfoResponse? data){
    formGroup.control('medical_expense_deposit').value = data?.medicalExpenseDeposit;
    formGroup.control('paymentDay').value = data?.paymentDay;
    formGroup.control('actual_cost').value = data?.actualCost;
    formGroup.control('settlement_day').value = data?.settlementDay;
    formGroup.control('actual_cost_breakdown').value = data?.actualCostBreakdown;
    formGroup.control('Refund_amount').value = data?.refundAmount;
  }
  ValueNotifier<AsyncData<HeadInfoResponse>> submitHeadInfoData = ValueNotifier(const AsyncData());
  Future<void> submitHeadInfo(FormGroup formGroup) async {
    try{
      saleHeadInfoData.value = const AsyncData(loading: true);
      final response = await saleRepository.postHeadInfo(
        HeadInfoRequest.fromJson(formGroup.control('head_info').value),
      );
      saleHeadInfoData.value = AsyncData(data: response);
      submitHeadInfoData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
      saleHeadInfoData.value = AsyncData(error: e); //
    }
  }

  ValueNotifier<AsyncData<ServiceFeeResponse>> serviceFreeData = ValueNotifier(const AsyncData());
  Future<void> fetchServiceFree(FormGroup formGroup) async{
    try{
      serviceFreeData.value = const AsyncData(loading: true);
      final response = await saleRepository.getServiceFee();
      insertServiceFree(formGroup, response);
      serviceFreeData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
    }
  }
  void insertServiceFree(FormGroup formGroup,ServiceFeeResponse? data){
   var serviceItem =  formGroup.control('service_item') as FormArray;
   for(var element in data!.serviceItem){
    serviceItem.add(
      FormGroup(
          {
            'item': FormControl<String>(value: element.item),
            'quantity': FormControl<int>(value: element.quantity),
            'unit': FormControl<String>(value: element.unit),
            'unit_price': FormControl<int>(value: element.unitPrice),
            'amount_of_money': FormControl<int>(value: element.amountOfMoney),
            'cost': FormControl<int>(value: element.cost),
            'profit': FormControl<int>(value: element.profit),
            'invoice_no': FormControl<int>(value: element.invoiceNo),
            'payment_document_no': FormControl<int>(value: element.paymentDocumentNo),
          },
        ),
    );
   }
    formGroup.control('amount_of_money_total_sale').value = data.amountOfMoneyTotalSale;
    formGroup.control('amount_of_money_total_tax').value = data.amountOfMoneyTotalTax;
    formGroup.control('amount_of_money_total_amount').value = data.amountOfMoneyTotalAmount;
    formGroup.control('cost_sale').value = data.costSale;
    formGroup.control('cost_tax').value = data.costTax;
    formGroup.control('cost_amount').value = data.costAmount;
    formGroup.control('profit_sale').value = data.profitSale;
    formGroup.control('profit_tax').value = data.profitTax;
    formGroup.control('profit_amount').value = data.profitAmount;
    formGroup.control('tax').value = data.tax;
    formGroup.control('tax_excluded').value = data.taxExcluded;
    formGroup.control('tax_exempt').value = data.taxExempt;
  }
  ValueNotifier<AsyncData<ServiceFeeResponse>> submitServiceFreeData = ValueNotifier(const AsyncData());
  Future<void> submitServiceFree(FormGroup formGroup) async {
    try{
      serviceFreeData.value = const AsyncData(loading: true);
      final response = await saleRepository.postServiceFee(
        ServiceFeeRequest.fromJson(formGroup.control('service_fee').value),
      );
      serviceFreeData.value = AsyncData(data: response);
      submitServiceFreeData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      serviceFreeData.value = AsyncData(error: e); //
    }

  }

  ValueNotifier<AsyncData<ExpensesResponse>> expensesData = ValueNotifier(const AsyncData());
  Future<void> fetchExpenses(FormGroup formGroup)  async{
    try{
      expensesData.value = const AsyncData(loading: true);
      final response = await saleRepository.getExpenses();
      insertExpenses(formGroup, response);

    }catch(e){
      logger.d(e);
      expensesData.value = AsyncData(error: e); //
    }
  }
  void insertExpenses(FormGroup formGroup, ExpensesResponse? data){
    formGroup.control('major_items').value = data?.majorItems;
   var submitItem =  formGroup.control('subitems') as FormArray;
   for(var element in data!.subitems!){
      submitItem.add(
        FormGroup({
          'submit': FormControl<String>(value: element.submit),
        }),
      );
   }
   formGroup.control('quantity').value = data.quantity;
   formGroup.control('unit').value = data.unit;
   formGroup.control('unit_price').value = data.unitPrice;
   formGroup.control('amount_of_money').value = data.amountOfMoney;
   formGroup.control('payment_document').value = data.paymentDocument;
   formGroup.control('total_expenses').value = data.totalExpenses;
   formGroup.control('total_expenses_tax').value = data.totalExpensesTax;
   formGroup.control('total_expenses_amount').value = data.totalExpensesAmount;
   formGroup.control('type_of_tax').value = data.typeOfTax;
  }

  ValueNotifier<AsyncData<ExpensesResponse>> submitExpensesData = ValueNotifier(const AsyncData());
  Future<void> submitExpenses(FormGroup formGroup) async {
    try{
       saleHeadInfoData.value = const AsyncData(loading: true);
    final response = await saleRepository.postExpenses(
      formGroup.control('expenses').value,
    );
    expensesData.value = AsyncData(data: response);
    submitExpensesData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
      submitExpensesData.value = AsyncData(error: e);
    }
   
  }

  ValueNotifier<AsyncData<TotalResponse>> totalData = ValueNotifier(const AsyncData());
  Future<void> fetchTotal(FormGroup formGroup) async{
    try{
      totalData.value = const AsyncData(loading: true);
      final response = await saleRepository.getTotal();
      insertTotal(formGroup, response);
    }catch(e){
      logger.d(e);
      totalData.value = AsyncData(error: e); //
    }

  }

  void insertTotal(FormGroup formGroup,TotalResponse? data){
    formGroup.control('total_sales').value = data?.totalSales;
    formGroup.control('total_sales_tax').value = data?.totalSaleTax;
    formGroup.control('total_sales_amount').value = data?.totalCost;
    formGroup.control('total_cost_tax').value = data?.totalCostTax;
    formGroup.control('gross_profit').value = data?.grossProfit;
    formGroup.control('gross_profit_tax').value = data?.grossProfitTax;
    formGroup.control('tax_included').value = data?.taxExcluded;
    formGroup.control('tax_exempt').value = data?.taxExempt;
    formGroup.control('gross_profit_tax2').value = data?.grossProfitTax2;
  }

  ValueNotifier<AsyncData<TotalResponse>> submitTotalData = ValueNotifier(const AsyncData());
  Future<void> submitTotal(FormGroup formGroup) async {
    try{
      submitTotalData.value = const AsyncData(loading: true);
      final response = await saleRepository.postTotal(
        TotalRequest.fromJson(formGroup.control('total').value),
      );
      totalData.value = AsyncData(data: response);
      submitTotalData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      submitTotalData.value = AsyncData(error: e);
    }
  }


  ValueNotifier<List<Items>> itemData = ValueNotifier([
    Items(item: '通訳'),
    Items(item: '1-B 割引（貴社にて東京国際\n大堀病院に初回連絡済のため）'),
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

class Items {
  String item;

  Items({required this.item});
}

class Unit {
  String item;
  Unit({required this.item});
}

class Tax {
  String tax;
  Tax({required this.tax});
}

class SubmitItem {
  String item;
  SubmitItem({required this.item});
}
