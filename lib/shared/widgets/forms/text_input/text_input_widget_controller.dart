import 'package:mobx/mobx.dart';
part 'text_input_widget_controller.g.dart';

class TextInputController = _TextInputControllerBase with _$TextInputController;

abstract class _TextInputControllerBase with Store {
  @observable
  String content = '';

  @action
  void setContent(String content) {
    print('Dados salvos no controller $content');
    this.content = content;
  }
}
