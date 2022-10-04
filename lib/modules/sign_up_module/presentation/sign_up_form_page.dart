import 'package:dio/dio.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/firestore_signup_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/google_signup_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/signup_rest_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/repository/sign_up_repository_impl.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/repository/sign_up_repository.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase_impl.dart';
import 'package:edge_delivery/modules/sign_up_module/presentation/sign_up_form_controller.dart';
import 'package:edge_delivery/shared/widgets/buttons/main_button.dart';
import 'package:edge_delivery/shared/widgets/forms/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  State<SignUpFormPage> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  late SignUpFormController controller;
  late ReactionDisposer d1;
  late ReactionDisposer d2;

  @override
  void initState() {
    super.initState();

    controller = SignUpFormController();

    d1 = reaction((_) => controller.userEntity, (userEntity) {
      handleSuccess(userEntity);
    });

    d2 = reaction((_) => controller.errorMessage, (message) {
      print('ERROR MESSAGE CAPTURADO!');
      handleFailure(message);
    }, equals: (s1, s2) => false);
  }

  @override
  void dispose() {
    d1();
    d2();

    super.dispose();
  }

  void handleFailure(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void handleSuccess(UserEntity? userEntity) {
    // Navigator.pushNamed(context, '/toDeliveryPage', arguments: userEntity);
    Modular.to.navigate('/delivery/', arguments: userEntity);
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
            Row(
              children: [
                controller.requestFuture != null &&
                        controller.requestFuture!.status == FutureStatus.pending
                    ? const CircularProgressIndicator()
                    : MainButtonWidget(
                        callback: controller.sendFirestore, title: 'Sign Up'),
                MainButtonWidget(
                    callback: controller.sendGoogleSignIn,
                    title: 'Google SignIn'),
              ],
            ),
          ],
        );
      }),
    );
  }
}
