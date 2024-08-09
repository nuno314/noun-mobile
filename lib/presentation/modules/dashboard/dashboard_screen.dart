import 'package:emotee/di/di.dart';
import 'package:emotee/gen/assets.gen.dart';
import 'package:emotee/presentation/base/base.dart';
import 'package:emotee/presentation/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widget/export.dart';
import 'account/account.dart';
import 'cubit/dashboard_cubit.dart';
import 'home/home.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends StateBase<DashboardScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themeColor.transparent,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            BlocListener<DashboardCubit, DashboardState>(
              listener: _cubitListener,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  KeepAliveWidget(
                    child: BlocProvider(
                      create: (context) => injector.get<HomeBloc>(),
                      child: const HomeScreen(),
                    ),
                  ),
                  KeepAliveWidget(
                    child: BlocProvider(
                      create: (context) => injector.get<AccountBloc>(),
                      child: const AccountScreen(),
                    ),
                  ),
                  KeepAliveWidget(
                    child: BlocProvider(
                      create: (context) => injector.get<AccountBloc>(),
                      child: const AccountScreen(),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) => CustomBottomNavigationBar(
                items: [
                  BottomBarItemData(
                    icon: Assets.svg.icHome.svg(width: 36.w),
                    selectedIcon: Assets.svg.icHomeFilled.svg(width: 36.w),
                  ),
                  BottomBarItemData(
                    icon: Assets.svg.icPost.svg(width: 36.w),
                    selectedIcon: Assets.svg.icPost.svg(width: 36.w),
                  ),
                  BottomBarItemData(
                    icon: Assets.svg.icAccount.svg(width: 36.w),
                    selectedIcon: Assets.svg.icAccountFilled.svg(width: 36.w),
                  ),
                ],
                selectedIdx: state.index,
                onItemSelection: onNavigationPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _cubitListener(BuildContext context, DashboardState state) {
    _pageController.jumpToPage(
      state.index,
    );
  }

  DashboardCubit get _cubit => BlocProvider.of(context);

  Future<bool> onNavigationPressed(int idx) async {
    _cubit.navigateTo(idx);
    return true;
  }

  @override
  AppBlocBase? get bloc => null;
}
