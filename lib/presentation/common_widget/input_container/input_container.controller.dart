part of 'input_container.dart';

class InputContainerProperties {
  late TextEditingController tdController;
  String? validation;
  bool isShowPassword;
  late FocusNode focusNode;

  InputContainerProperties({
    TextEditingController? tdController,
    this.validation,
    this.isShowPassword = false,
    FocusNode? focusNode,
  }) {
    this.focusNode = focusNode ?? FocusNode();
    this.tdController = tdController ?? TextEditingController();
  }

  void withValue({
    TextEditingController? tdController,
    FocusNode? focusNode,
  }) {
    this.tdController = tdController ?? this.tdController;
    this.focusNode = focusNode ?? this.focusNode;
  }
}

class InputContainerController extends ValueNotifier<InputContainerProperties> {
  InputContainerController({InputContainerProperties? value})
      : super(value ?? InputContainerProperties());

  String get text => value.tdController.text;

  void resetValidation() {
    value.validation = null;
    notifyListeners();
  }

  set text(String? v) {
    value.tdController.let((ctrl) {
      ctrl.value = ctrl.value.copyWith(
        text: v,
        selection: TextSelection.collapsed(offset: v?.length ?? 0),
      );
    });
    resetValidation();
  }

  void setError(String? message, {bool focusOn = true}) {
    if (focusOn) {
      value.focusNode.requestFocus();
    }
    value.validation = message;
    notifyListeners();
  }

  void reset() {
    value = InputContainerProperties();
    notifyListeners();
  }

  bool get isShowPass => value.isShowPassword;

  void showOrHidePass() {
    value.isShowPassword = !value.isShowPassword;
    notifyListeners();
  }

  set setText(String v) {
    value.tdController.text = v;
    resetValidation();
  }

  @override
  void dispose() {
    value.focusNode.dispose();
    value.tdController.dispose();
    super.dispose();
  }
}
