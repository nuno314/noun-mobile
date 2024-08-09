import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../dashboard_constants.dart';

part 'dashboard_state.dart';

@Injectable()
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardHome());

  void navigateTo(int idx) {
    if (idx == DashboardPage.home.index) {
      emit(DashboardHome());
    } else if (idx == DashboardPage.post.index) {
      emit(DashboardPost());
    } else if (idx == DashboardPage.account.index) {
      emit(DashboardAccount());
    } else {
      assert(false, 'Page with idx $idx not found!');
    }
  }

  List<DashboardState> get dashboardStates => [
        DashboardHome(),
        DashboardPost(),
        DashboardAccount(),
      ];

  /// -1: Unsupported
  ///  0: login required
  ///  1: navigate success
  int navigateByRoute(String route) {
    final state = dashboardStates.firstWhereOrNull((e) => e.route == route);
    if (state == null) {
      return -1;
    }
    navigateTo(state.index);
    return 1;
  }
}
