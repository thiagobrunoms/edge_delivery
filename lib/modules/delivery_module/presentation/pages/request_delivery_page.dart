import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/shared/widgets/buttons/main_button.dart';
import 'package:flutter/material.dart';

class RequestDeliveryPage extends StatefulWidget {
  final UserEntity userEntity;
  const RequestDeliveryPage({super.key, required this.userEntity});

  @override
  State<RequestDeliveryPage> createState() => _RequestDeliveryPageState();
}

class _RequestDeliveryPageState extends State<RequestDeliveryPage> {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _buildAppBar(),
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

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.userEntity.name),
          const Icon(Icons.menu)
        ],
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
        Text('Good day, ${widget.userEntity.name}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
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
