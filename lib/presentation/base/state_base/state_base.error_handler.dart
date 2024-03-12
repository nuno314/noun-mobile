part of '../base.dart';

extension StateBaseErrorHandlerExt on StateBase {
  void _onError(ErrorData error) {
    LogUtils.w(
        '''[$runtimeType] error ${error.type} message ${error.message}''');
    if (!mounted) {
      LogUtils.w('[$runtimeType] error when state disposed!');
      return;
    }
    hideLoading();
    switch (error.type) {
      case ErrorType.unauthorized:
      case ErrorType.grapQLInvalidToken:
        if (errorTypeShowing == error.type) {
          break;
        }
        errorTypeShowing = error.type;
        requireLogin(onSuccess: () {});
        break;
      case ErrorType.httpException:
        if (errorTypeShowing == ErrorType.httpException) {
          break;
        }
        errorTypeShowing = ErrorType.httpException;
        if (error.statusCode != null &&
            error.statusCode! >= 500 &&
            error.statusCode! < 600) {
          showErrorDialog(tr.technicalIssues);
        } else {
          onLogicError(error.message);
        }
        break;
      case ErrorType.timeout:
        if (errorTypeShowing == ErrorType.timeout) {
          break;
        }
        errorTypeShowing = ErrorType.timeout;
        showErrorDialog(tr.connectionTimeout);
        break;
      case ErrorType.noInternet:
        if (errorTypeShowing == ErrorType.noInternet) {
          break;
        }
        errorTypeShowing = ErrorType.noInternet;
        Connectivity().checkConnectivity().then((value) {
          if (value == ConnectivityResult.none) {
            showNoInternetDialog();
          } else {
            showErrorDialog(tr.technicalIssues);
          }
        });
        break;
      case ErrorType.unknown:
        if (errorTypeShowing == ErrorType.unknown) {
          break;
        }
        errorTypeShowing = ErrorType.unknown;
        showErrorDialog(tr.unknownError);
        break;
      case ErrorType.grapQLUnknown:
        if (errorTypeShowing == ErrorType.grapQLUnknown) {
          break;
        }
        errorTypeShowing = ErrorType.grapQLUnknown;
        onLogicError(error.message);
        break;
      case ErrorType.serverUnExpected:
        if (errorTypeShowing == ErrorType.serverUnExpected) {
          break;
        }
        errorTypeShowing = ErrorType.serverUnExpected;
        showErrorDialog(tr.serverMaintenance);
        break;
      default:
        break;
    }
  }
}
