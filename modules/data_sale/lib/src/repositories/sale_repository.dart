
import 'package:core_network/entities.dart';

abstract class SaleRepository {
  Future<HeadInfoResponse> getHeadInfo();

  Future<HeadInfoResponse> postHeadInfo(
    HeadInfoRequest headInfoRequest,
  );

  Future<ExpensesResponse> getExpenses();

  Future<ExpensesResponse> postExpenses(
    ExpensesRequest expensesRequest,
  );

  Future<ServiceFeeResponse> getServiceFee();

  Future<ServiceFeeResponse> postServiceFee(
    ServiceFeeRequest serviceFeeRequest,
  );

  Future<TotalResponse> getTotal();

  Future<TotalResponse> postTotal(
    TotalRequest totalRequest,
  );
}
