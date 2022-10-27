import 'package:edge_delivery/modules/sign_up_module/presentation/pages/form_page.dart';
import 'package:edge_delivery/modules/sign_up_module/presentation/sign_up_form_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (context, args) => const SignUpFormPage()),
        ChildRoute('/', child: (context, args) => const FormPage()),
      ];
}
