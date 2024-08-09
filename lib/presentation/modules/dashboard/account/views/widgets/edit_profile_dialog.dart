import 'package:emotee/presentation/common_widget/box_color.dart';
import 'package:emotee/presentation/common_widget/input_container/input_container.dart';
import 'package:emotee/presentation/extentions/extention.dart';
import 'package:emotee/presentation/theme/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileArgs {
  final String? username;
  final String? bio;

  const EditProfileArgs({
    this.username,
    this.bio,
  });
}

class EditProfileDialog extends StatefulWidget {
  final EditProfileArgs args;

  const EditProfileDialog({
    this.args = const EditProfileArgs(),
    super.key,
  });

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  final _usernameCtrl = InputContainerController();

  final _bioCtrl = InputContainerController();

  @override
  void initState() {
    super.initState();
    _usernameCtrl.text = widget.args.username;
    _bioCtrl.text = widget.args.bio;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.8,
            padding: EdgeInsets.fromLTRB(
              16.w,
              50.h,
              16.w,
              0,
            ),
            child: Center(
              child: BoxColor(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 20.h,
                ),
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(32.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputContainer(
                      title: tr.username,
                      controller: _usernameCtrl,
                    ),
                    const Divider(),
                    InputContainer(
                      title: tr.bio,
                      controller: _bioCtrl,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ThemeButton.primary(
          context: context,
          title: tr.confirm,
          onPressed: _onTapConfirm,
        ),
      ],
    );
  }

  _onTapConfirm() {
    Navigator.pop(
      context,
      EditProfileArgs(
        username: _usernameCtrl.text,
        bio: _bioCtrl.text,
      ),
    );
  }
}
