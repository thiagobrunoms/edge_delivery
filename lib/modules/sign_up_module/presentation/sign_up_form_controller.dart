import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:mobx/mobx.dart';
part 'sign_up_form_controller.g.dart';

class SignUpFormController = _SignUpFormControllerBase
    with _$SignUpFormController;

abstract class _SignUpFormControllerBase with Store {
  SignUpUsecase usecase;

  _SignUpFormControllerBase({required this.usecase});
}
