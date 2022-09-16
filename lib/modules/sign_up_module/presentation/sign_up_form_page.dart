import 'package:edge_delivery/shared/widgets/forms/text_input/text_input_widget.dart';
import 'package:flutter/material.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  State<SignUpFormPage> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
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
      body: Column(
        children: const [
          TextInputWidget(
            label: 'Nome',
            hint: 'Seu nome completo',
            type: TextInputType.name,
            isObuscured: false,
          ),
          TextInputWidget(
            label: 'Email',
            hint: 'nome@dominio.com.br',
            type: TextInputType.emailAddress,
            isObuscured: false,
          ),
          TextInputWidget(
            label: 'Senha',
            hint: 'Senha de pelo menos 8 digitos',
            type: TextInputType.text,
            isObuscured: true,
          ),
        ],
      ),
    );
  }
}
