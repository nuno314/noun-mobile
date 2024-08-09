part of 'account_screen.dart';

extension AccountAction on _AccountScreenState {
  void _blocListener(BuildContext context, AccountState state) {}

  _onTapEditProfile() {
    showModal(
      context,
      const EditProfileDialog(),
      title: 'Thông tin',
    ).then((value) {
      if (value is EditProfileArgs) {
        bloc.add(
          UpdateProfileEvent(
            username: value.username,
            bio: value.bio,
          ),
        );
      }
    });
  }
}
