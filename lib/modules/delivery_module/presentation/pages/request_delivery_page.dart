import 'package:edge_delivery/modules/delivery_module/presentation/widgets/default_app_bar.dart';
import 'package:edge_delivery/modules/session_controller.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/shared/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RequestDeliveryPage extends StatefulWidget {
  const RequestDeliveryPage({super.key});

  @override
  State<RequestDeliveryPage> createState() => _RequestDeliveryPageState();
}

class _RequestDeliveryPageState extends State<RequestDeliveryPage> {
  late SessionController sessionController;
  int selectedBarIndex = 0;

  @override
  void initState() {
    super.initState();

    sessionController = Modular.get<SessionController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const DefaultAppBar(),
                _buildCenterImage(),
                const SizedBox(height: 20),
                _buildWelcomeMessage(),
                const SizedBox(height: 30),
                _buildRequestButton(),
              ],
            ),
          ),
        ),
    );
  }


  Widget _buildCenterImage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/delivery.png'))
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Column(
      children: [
        Text('Good day, ${sessionController.userEntity.name}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
        const SizedBox(height: 10,),
        const Text('Want to send something today?', style: TextStyle(fontSize: 14.0),),
        const Text('Request new Delivery?', style: TextStyle(fontSize: 14.0),),
      ],
    );
  }

  Widget _buildRequestButton() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.95,
      child: MainButtonWidget(callback: () {}, title: 'New Delivery Request'));
  }
}
