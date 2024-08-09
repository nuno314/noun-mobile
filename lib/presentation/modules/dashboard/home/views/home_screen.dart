import 'package:emotee/common/utils.dart';
import 'package:emotee/generated/assets.dart';
import 'package:emotee/presentation/common_widget/box_color.dart';
import 'package:emotee/presentation/common_widget/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../base/base.dart';
import '../bloc/home_bloc.dart';

part 'home.action.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends StateBase<HomeScreen> {
  @override
  HomeBloc get bloc => BlocProvider.of(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              0.w,
              MediaQuery.of(context).padding.top + 16.h,
              0.w,
              16.h,
            ),
            child: Column(
              children: [
                _buildPost(state),
                const Divider(
                  color: Colors.grey,
                ),
                // _buildNewsFeed(state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPost(HomeState state) {
    return BoxColor(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 4.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImageWrapper.avatar(
            url: '',
            width: 40.r,
            height: 40.r,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'lhtt772',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Thấy n-sao?',
                  style: textTheme.bodySmall,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svg.icImage,
                      width: 28.r,
                      height: 28.r,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      Assets.svg.icCamera,
                      width: 28.r,
                      height: 28.r,
                      color: Colors.black54,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
