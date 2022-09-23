import 'package:dio/dio.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/google_signup_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/signup_rest_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/repository/sign_up_repository_impl.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/repository/sign_up_repository.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase_impl.dart';
import 'package:edge_delivery/modules/sign_up_module/presentation/sign_up_form_controller.dart';
import 'package:edge_delivery/shared/widgets/buttons/main_button.dart';
import 'package:edge_delivery/shared/widgets/forms/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  State<SignUpFormPage> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  late SignUpFormController controller;

  @override
  void initState() {
    super.initState();

    Dio dio = Dio();

    SignUpRestDatasource datasource = SignUpRestDatasource(dio: dio);
    SignUpRepository repository = SignUpRepositoryImpl(datasource: datasource);
    SignUpUsecase usecase = SignUpUsecaseImpl(repository: repository);
    controller = SignUpFormController(usecase: usecase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar conta',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Observer(builder: (_) {
        return Column(
          children: [
            TextInputWidget(
              hint: 'Seu nome completo',
              type: TextInputType.name,
              isObuscured: false,
              onChangedCallback: controller.setName,
            ),
            TextInputWidget(
              hint: 'nome@dominio.com.br',
              type: TextInputType.emailAddress,
              isObuscured: false,
              onChangedCallback: controller.setEmail,
            ),
            TextInputWidget(
              hint: 'Senha de pelo menos 8 digitos',
              type: TextInputType.text,
              isObuscured: true,
              errorMessage: controller.checkPasswords,
              onChangedCallback: controller.setPassword,
            ),
            TextInputWidget(
              hint: 'Repetir Senha',
              type: TextInputType.text,
              isObuscured: true,
              errorMessage: controller.checkPasswords,
              onChangedCallback: controller.setRepeatPassword,
            ),
            controller.requestFuture != null &&
                    controller.requestFuture!.status == FutureStatus.pending
                ? const CircularProgressIndicator()
                : MainButtonWidget(callback: controller.send, title: 'Sign Up')
          ],
        );
      }),
    );
  }
}
