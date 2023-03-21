import 'package:flutterfire_ui/i10n.dart';

class AuthGateLabel extends DefaultLocalizations {
  const AuthGateLabel();

  @override
  String get confirmPasswordDoesNotMatchErrorText => 'パスワードが一致しません';

  @override
  String get confirmPasswordIsRequiredErrorText => '確認用パスワードを入力してください';

  @override
  String get emailIsRequiredErrorText => 'メールアドレスを入力してください';

  @override
  String get forgotPasswordButtonLabel => 'パスワードを忘れた場合';

  @override
  String get forgotPasswordHintText => '登録しているメールアドレスにパスワード再設定用のURLをお送りします。';

  @override
  String get forgotPasswordViewTitle => 'パスワード再設定';

  @override
  String get isNotAValidEmailErrorText => '適切なメールアドレスを入力してください';

  @override
  String get goBackButtonLabel => '戻る';

  @override
  String get passwordIsRequiredErrorText => 'パスワードを入力してください';

  @override
  String get passwordResetEmailSentText =>
      '登録しているメールアドレスにパスワード再設定用のURLをお送りしました。メールをご確認ください。';

  @override
  String get registerActionText => '登録';

  @override
  String get registerHintText => 'アカウントをお持ちでないですか？';

  @override
  String get registerText => 'アカウントを作成';

  @override
  String get resetPasswordButtonLabel => '送信';

  @override
  String get signInActionText => 'ログイン';

  @override
  String get signInHintText => '既にアカウントがありますか？';

  @override
  String get signInText => 'ログイン';

  @override
  String get userNotFoundErrorText => 'ユーザが見つかりません';

  @override
  String get wrongOrNoPasswordErrorText => 'パスワードが正しくありません';
}
