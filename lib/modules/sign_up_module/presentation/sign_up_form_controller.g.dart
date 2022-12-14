// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpFormController on _SignUpFormControllerBase, Store {
  Computed<String?>? _$checkPasswordsComputed;

  @override
  String? get checkPasswords => (_$checkPasswordsComputed ??= Computed<String?>(
          () => super.checkPasswords,
          name: '_SignUpFormControllerBase.checkPasswords'))
      .value;

  late final _$nameAtom =
      Atom(name: '_SignUpFormControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_SignUpFormControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignUpFormControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$repeatPasswordAtom =
      Atom(name: '_SignUpFormControllerBase.repeatPassword', context: context);

  @override
  String get repeatPassword {
    _$repeatPasswordAtom.reportRead();
    return super.repeatPassword;
  }

  @override
  set repeatPassword(String value) {
    _$repeatPasswordAtom.reportWrite(value, super.repeatPassword, () {
      super.repeatPassword = value;
    });
  }

  late final _$requestFutureAtom =
      Atom(name: '_SignUpFormControllerBase.requestFuture', context: context);

  @override
  ObservableFuture<Either<SignUpFailure, UserEntity>>? get requestFuture {
    _$requestFutureAtom.reportRead();
    return super.requestFuture;
  }

  @override
  set requestFuture(
      ObservableFuture<Either<SignUpFailure, UserEntity>>? value) {
    _$requestFutureAtom.reportWrite(value, super.requestFuture, () {
      super.requestFuture = value;
    });
  }

  late final _$userEntityAtom =
      Atom(name: '_SignUpFormControllerBase.userEntity', context: context);

  @override
  UserEntity? get userEntity {
    _$userEntityAtom.reportRead();
    return super.userEntity;
  }

  @override
  set userEntity(UserEntity? value) {
    _$userEntityAtom.reportWrite(value, super.userEntity, () {
      super.userEntity = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SignUpFormControllerBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$sendRestAsyncAction =
      AsyncAction('_SignUpFormControllerBase.sendRest', context: context);

  @override
  Future<void> sendRest() {
    return _$sendRestAsyncAction.run(() => super.sendRest());
  }

  late final _$sendFirestoreAsyncAction =
      AsyncAction('_SignUpFormControllerBase.sendFirestore', context: context);

  @override
  Future<void> sendFirestore() {
    return _$sendFirestoreAsyncAction.run(() => super.sendFirestore());
  }

  late final _$sendGoogleSignInAsyncAction = AsyncAction(
      '_SignUpFormControllerBase.sendGoogleSignIn',
      context: context);

  @override
  Future<void> sendGoogleSignIn() {
    return _$sendGoogleSignInAsyncAction.run(() => super.sendGoogleSignIn());
  }

  late final _$_sendAsyncAction =
      AsyncAction('_SignUpFormControllerBase._send', context: context);

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  late final _$_SignUpFormControllerBaseActionController =
      ActionController(name: '_SignUpFormControllerBase', context: context);

  @override
  void setName(String name) {
    final _$actionInfo = _$_SignUpFormControllerBaseActionController
        .startAction(name: '_SignUpFormControllerBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_SignUpFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_SignUpFormControllerBaseActionController
        .startAction(name: '_SignUpFormControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_SignUpFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_SignUpFormControllerBaseActionController
        .startAction(name: '_SignUpFormControllerBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_SignUpFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRepeatPassword(String repeatPassword) {
    final _$actionInfo = _$_SignUpFormControllerBaseActionController
        .startAction(name: '_SignUpFormControllerBase.setRepeatPassword');
    try {
      return super.setRepeatPassword(repeatPassword);
    } finally {
      _$_SignUpFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
repeatPassword: ${repeatPassword},
requestFuture: ${requestFuture},
userEntity: ${userEntity},
errorMessage: ${errorMessage},
checkPasswords: ${checkPasswords}
    ''';
  }
}
