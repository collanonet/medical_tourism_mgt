import 'package:data_auth/data_auth.dart';
import 'package:get_it/get_it.dart';

abstract class Guard {
  Future<bool> resolve(String policy);
}

class RoleGuard extends Guard {
  RoleGuard({required this.policies});

  final Map<String, List<PermissionRole>> policies;

  @override
  Future<bool> resolve(String policy) async {
    final allowedRoles = policies[policy] ?? const [];
    // final userRole = await GetIt.I<AuthzRepository>().getPermissionRole();
    //
    // return allowedRoles.contains(userRole);

    return false;
  }
}
