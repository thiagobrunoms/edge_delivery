import 'package:edge_delivery/modules/sign_up_module/presentation/pages/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  FormController controller = FormController();
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<int>(
                stream: controller.numberStream,
                builder: (context, snapshot) {
                  int number = snapshot.hasData ? snapshot.data! : 0;
                  return Text('Numero: $number ', style: const TextStyle(fontSize: 20),);
                }
              ),

              StreamBuilder<int>(
                stream: controller.numberOddStream,
                builder: (context, snapshot) {
                  int number = snapshot.hasData ? snapshot.data! : 0;
                  return Text('Par: $number', style: const TextStyle(fontSize: 20),);
                }
              ),
              
              StreamBuilder<int>(
                stream: controller.numberDoubleStream,
                builder: (context, snapshot) {
                  int number = snapshot.hasData ? snapshot.data! : 0;
                  return Text('Dobro: $number', style: const TextStyle(fontSize: 20),);
                }
              ),
            ],
          )
        ),
      ),
      floatingActionButton: 
        FloatingActionButton(onPressed: () {
          quantity += 1;
          controller.numberController.sink.add(quantity);
      }, child: Icon(Icons.add),),
    );
  }
}