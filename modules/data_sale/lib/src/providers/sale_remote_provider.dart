// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaleRemoteProvider {
  SaleRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<HeadInfoResponse> generateHeadInfo() async{
    return apiService.getHeadInfo();
  }

  Future<HeadInfoResponse> postHeadInfo(HeadInfoRequest headInfoRequest) async{
    return apiService.postHeadInfo(headInfoRequest);
  }

  Future<ExpensesResponse> getExpenses() async{
    return apiService.getExpense();
  }

  Future<ExpensesResponse> postExpense(ExpensesRequest expensesRequest) async{
    return apiService.postExpense(expensesRequest);
  }

  Future<ServiceFeeResponse> getServiceFree() async{
    return apiService.getServiceFree();
  }

  Future<ServiceFeeResponse> postServiceFree(ServiceFeeRequest serviceFeeRequest) async{
    return apiService.postServiceFree(serviceFeeRequest);
  }

  Future<TotalResponse> getTotal() async{
    return apiService.getTotal();
  }

  Future<TotalResponse> postTotal(TotalRequest totalRequest) async{
    return apiService.postTotal(totalRequest);
  }
}
