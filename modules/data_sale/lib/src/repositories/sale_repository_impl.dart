// Package imports:
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../providers/sale_local_provider.dart';
import '../providers/sale_remote_provider.dart';
import 'sale_repository.dart';

@Injectable(as: SaleRepository)
class SaleRepositoryIml extends SaleRepository {
  SaleRepositoryIml({
    required this.remote,
    required this.local,
  });

  final SaleRemoteProvider remote;
  final SaleLocalProvider local;

  @override
  Future<ExpensesResponse> getExpenses() {
   return remote.getExpenses();
  }

  @override
  Future<HeadInfoResponse> getHeadInfo() {
   return remote.generateHeadInfo();
  }

  @override
  Future<ServiceFeeResponse> getServiceFee() {
    return remote.getServiceFree();
  }

  @override
  Future<TotalResponse> getTotal() {
    return remote.getTotal();
  }

  @override
  Future<ExpensesResponse> postExpenses(ExpensesRequest expensesRequest) {
    return remote.postExpense(expensesRequest);
  }

  @override
  Future<HeadInfoResponse> postHeadInfo(HeadInfoRequest headInfoRequest) {
    return remote.postHeadInfo(headInfoRequest);
  }

  @override
  Future<ServiceFeeResponse> postServiceFee(ServiceFeeRequest serviceFeeRequest) {
    return remote.postServiceFree(serviceFeeRequest);
  }

  @override
  Future<TotalResponse> postTotal(TotalRequest totalRequest) {
    return remote.postTotal(totalRequest);
  }

}
