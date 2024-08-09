part of 'extention.dart';

Future<dynamic> showNoticeDialog({
  required BuildContext context,
  required String message,
  String? title,
  String? titleBtn,
  bool barrierDismissible = true,
  Function()? onClose,
  bool useRootNavigator = true,
  bool dismissWhenAction = true,
}) {
  dismissFunc() {
    if (dismissWhenAction) {
      Navigator.of(context, rootNavigator: useRootNavigator).pop();
    }
  }

  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      final theme = Theme.of(context);

      showAndroidDialog() => AlertDialog(
            title: Text(
              title ?? tr.inform,
              style: theme.textTheme.headlineSmall,
            ),
            content: Text(
              message,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  dismissFunc.call();
                  onClose?.call();
                },
                child: Text(titleBtn ?? tr.ok),
              )
            ],
          );

      if (kIsWeb) {
        return showAndroidDialog();
      } else if (Platform.isAndroid) {
        return showAndroidDialog();
      } else {
        return CupertinoAlertDialog(
          title: Text(title ?? tr.inform),
          content: Text(
            message,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                dismissFunc.call();
                onClose?.call();
              },
              child: Text(titleBtn ?? tr.ok),
            ),
          ],
        );
      }
    },
  );
}

Future<dynamic> showNoticeErrorDialog({
  required BuildContext context,
  required String message,
  bool barrierDismissible = false,
  void Function()? onClose,
  bool useRootNavigator = true,
  String? titleBtn,
}) {
  return showNoticeDialog(
    context: context,
    message: message,
    barrierDismissible: barrierDismissible,
    onClose: onClose,
    titleBtn: titleBtn ?? tr.ok,
    useRootNavigator: useRootNavigator,
    title: tr.error,
  );
}

Future<dynamic> showNoticeWarningDialog({
  required BuildContext context,
  required String message,
  bool barrierDismissible = false,
  void Function()? onClose,
  bool useRootNavigator = true,
}) {
  return showNoticeDialog(
    context: context,
    message: message,
    barrierDismissible: barrierDismissible,
    onClose: onClose,
    titleBtn: tr.ok,
    useRootNavigator: useRootNavigator,
    title: tr.warning,
  );
}

Future<dynamic> showNoticeConfirmDialog({
  required BuildContext context,
  required String message,
  required String title,
  bool barrierDismissible = true,
  String? titleBtnDone,
  String? titleBtnCancel,
  void Function()? onConfirmed,
  void Function()? onCanceled,
  bool useRootNavigator = true,
  bool dismissWhenAction = true,
  TextStyle? styleBtnRight,
  TextStyle? styleBtnLeft,
}) {
  dismissFunc() {
    if (dismissWhenAction) {
      Navigator.of(context, rootNavigator: useRootNavigator).pop();
    }
  }

  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      final theme = Theme.of(context);

      showAndroidDialog() => AlertDialog(
            title: Text(
              title,
              style: theme.textTheme.headlineSmall,
            ),
            content: Text(
              message,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  dismissFunc.call();
                  onCanceled?.call();
                },
                child: Text(
                  titleBtnCancel ?? tr.cancel,
                  style: styleBtnLeft ??
                      theme.textTheme.labelLarge?.copyWith(
                        color: themeColor.primaryColor,
                      ),
                ),
              ),
              TextButton(
                onPressed: () {
                  dismissFunc.call();
                  onConfirmed?.call();
                },
                child: Text(
                  titleBtnDone ?? tr.confirm,
                  style: styleBtnRight ??
                      theme.textTheme.labelLarge?.copyWith(
                        color: themeColor.primaryColor,
                      ),
                ),
              ),
            ],
          );

      if (kIsWeb) {
        return showAndroidDialog();
      } else if (Platform.isAndroid) {
        return showAndroidDialog();
      } else {
        Widget _buildAction({
          Function()? onTap,
          required String title,
          TextStyle? style,
        }) {
          return RawMaterialButton(
            constraints: const BoxConstraints(minHeight: 45),
            padding: EdgeInsets.zero,
            onPressed: () {
              dismissFunc.call();
              onTap?.call();
            },
            child: Text(
              title,
              style: style ??
                  theme.textTheme.labelLarge!.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          );
        }

        return CupertinoAlertDialog(
          title: Text(
            title,
            style: theme.textTheme.headlineSmall,
          ),
          content: Text(
            message,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: _buildAction(
                    onTap: onCanceled,
                    title: titleBtnCancel ?? tr.cancel,
                    style: styleBtnLeft,
                  ),
                ),
                Container(width: 0.5, height: 44, color: Colors.grey),
                Expanded(
                  child: _buildAction(
                    onTap: onConfirmed,
                    title: titleBtnDone ?? tr.confirm,
                    style: styleBtnRight,
                  ),
                ),
              ],
            )
          ],
        );
      }
    },
  );
}


Widget buildModalBottomSheet({
  required BuildContext context,
  required Widget body,
  bool useRootNavigator = true,
  double? bottomPadding,
  String? title,
  void Function()? onClose,
}) {
  final mediaData = MediaQuery.of(context);

  final padding = mediaData.padding;
  final size = mediaData.size;
  final maxContentSize = size.height - padding.top - padding.bottom - 64;
  final _scrollController = ScrollController();
  final themeColor = Theme.of(context).colorScheme;
  return Padding(
    padding: mediaData.viewInsets,
    child: Wrap(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            bottom: bottomPadding ?? mediaData.padding.bottom,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadiusDirectional.only(
              topEnd: Radius.circular(8),
              topStart: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black12,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    key: const ValueKey('ModalBottomSheet_close_btn'),
                    onPressed: onClose ??
                        () => Navigator.of(
                              context,
                              rootNavigator: useRootNavigator,
                            ).pop(),
                    icon: Icon(
                      Icons.close,
                      size: 24,
                      color: themeColor.primary,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
                thickness: 0.2,
                color: themeColor.primary,
              ),
              Container(
                constraints: BoxConstraints(maxHeight: maxContentSize),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: body,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}


Future<dynamic> showModal(
  BuildContext context,
  Widget body, {
  bool useRootNavigator = true,
  double? bottomPadding,
  String? title,
  void Function()? onClose,
}) {
  return showModalBottomSheet<dynamic>(
    context: context,
    useRootNavigator: useRootNavigator,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return buildModalBottomSheet(
        context: context,
        body: body,
        bottomPadding: bottomPadding,
        onClose: onClose,
        title: title,
        useRootNavigator: useRootNavigator,
      );
    },
  );
}



Future<void> showActionDialog(
  BuildContext context, {
  Map<String, void Function()> actions = const <String, void Function()>{},
  String title = '',
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  bool dimissWhenSelect = true,
}) {
  if (kIsWeb || Platform.isAndroid) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            ...actions.entries
                .map<TextButton>(
                  (e) => TextButton(
                    onPressed: () {
                      if (dimissWhenSelect) {
                        Navigator.of(
                          context,
                          rootNavigator: useRootNavigator,
                        ).pop();
                      }
                      e.value.call();
                    },
                    child: Text(e.key),
                  ),
                )
                .toList(),
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: useRootNavigator).pop();
              },
              child: Text(tr.cancel),
            ),
          ],
        );
      },
    );
  } else {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: useRootNavigator,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: barrierDismissible,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return CupertinoActionSheet(
          actions: [
            ...actions.entries.map(
              (e) => CupertinoActionSheetAction(
                onPressed: () {
                  if (dimissWhenSelect) {
                    if (dimissWhenSelect) {
                      Navigator.of(
                        context,
                        rootNavigator: useRootNavigator,
                      ).pop();
                    }
                    e.value.call();
                  }
                },
                child: Text(
                  e.key,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
          title: Text(
            title,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(
                context,
                rootNavigator: useRootNavigator,
              ).pop();
            },
            child: Text(
              tr.cancel,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
