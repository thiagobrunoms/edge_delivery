// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_input_widget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextInputController on _TextInputControllerBase, Store {
  late final _$contentAtom =
      Atom(name: '_TextInputControllerBase.content', context: context);

  @override
  String get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$_TextInputControllerBaseActionController =
      ActionController(name: '_TextInputControllerBase', context: context);

  @override
  void setContent(String content) {
    final _$actionInfo = _$_TextInputControllerBaseActionController.startAction(
        name: '_TextInputControllerBase.setContent');
    try {
      return super.setContent(content);
    } finally {
      _$_TextInputControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
content: ${content}
    ''';
  }
}
