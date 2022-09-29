import 'package:edge_delivery/shared/core/failures/failure.dart';

class SignUpFailure extends Failure {
  int errorCode = 0;

  SignUpFailure({required super.message});
}
