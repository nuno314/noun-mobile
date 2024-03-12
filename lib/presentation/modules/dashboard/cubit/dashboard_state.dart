part of 'dashboard_cubit.dart';

abstract class DashboardState {
  final int index;

  String get route;

  DashboardState(this.index);
}

class DashboardHome extends DashboardState {
  DashboardHome() : super(DashboardPage.home.index);

  @override
  String get route => 'home';
}

class DashboardPost extends DashboardState {
  DashboardPost() : super(DashboardPage.post.index);

  @override
  String get route => 'post';
}

class DashboardAccount extends DashboardState {
  DashboardAccount() : super(DashboardPage.account.index);

  @override
  String get route => 'account';
}
