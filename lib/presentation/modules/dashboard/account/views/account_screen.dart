import 'package:emotee/common/utils.dart';
import 'package:emotee/generated/assets.dart';
import 'package:emotee/presentation/common_widget/box_color.dart';
import 'package:emotee/presentation/common_widget/post_widget.dart';
import 'package:emotee/presentation/extentions/extention.dart';
import 'package:emotee/presentation/modules/dashboard/account/views/widgets/edit_profile_dialog.dart';
import 'package:emotee/presentation/theme/theme_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../base/base.dart';
import '../../../auth/login/login_coordinator.dart';
import '../bloc/account_bloc.dart';

part 'account.action.dart';

class AccountScreen extends StatefulWidget {
  static String routeName = '/account';

  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends StateBase<AccountScreen> {
  @override
  AccountBloc get bloc => BlocProvider.of(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    return BlocConsumer<AccountBloc, AccountState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfile(state),
                const Divider(
                  color: Colors.black54,
                ),
                const PostWidget(),
                const PostWidget(),
                const PostWidget(),
                const PostWidget(),
                const PostWidget(),
                const PostWidget(),
                const PostWidget(),
                const PostWidget(),
                const PostWidget(),
                ThemeButton.primary(
                  context: context,
                  title: 'LogOut',
                  onPressed: _onTapLogOut,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _onTapLogOut() {
    FirebaseAuth.instance.signOut();
    context.goToLogin();
  }

  Widget _buildProfile(AccountState state) {
    return BoxColor(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      state.user?.email ?? '--',
                      style: textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
              SvgPicture.asset(
                Assets.svg.icAddAvatar,
                width: 48.r,
                height: 48.r,
              ),
              // CachedNetworkImageWrapper.avatar(
              //   url: '',
              //   width: 60.r,
              //   height: 60.r,
              // ),
              SizedBox(height: 4.h),
            ],
          ),
          Text(
            'Chưa có người theo dõi',
            style: textTheme.bodySmall,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: ThemeButton.primary(
                  context: context,
                  title: 'Chỉnh sửa trang cá nhân',
                  padding: EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 2.h,
                  ),
                  constraints: const BoxConstraints(),
                  onPressed: _onTapEditProfile,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  
}
