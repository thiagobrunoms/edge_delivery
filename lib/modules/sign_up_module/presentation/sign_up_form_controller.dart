import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/firestore_signup_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/google_signup_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/sign_up_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/signup_rest_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/data/repository/sign_up_repository_impl.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/repository/sign_up_repository.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase_impl.dart';
import 'package:edge_delivery/modules/sign_up_module/failures/signup_failure.dart';
import 'package:edge_delivery/shared/usecases/usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_form_controller.g.dart';

class SignUpFormController = _SignUpFormControllerBase
    with _$SignUpFormController;

abstract class _SignUpFormControllerBase with Store {
  late SignUpUsecase usecase;

  _SignUpFormControllerBase();

  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String repeatPassword = "";

  @observable
  ObservableFuture<Either<SignUpFailure, UserEntity>>? requestFuture;

  @observable
  UserEntity? userEntity;

  @observable
  String errorMessage = "";

  @action
  void setName(String name) => this.name = name;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  @action
  void setRepeatPassword(String repeatPassword) =>
      this.repeatPassword = repeatPassword;

  @computed
  String? get checkPasswords =>
      password != repeatPassword ? "Senhas incompatíveis" : null;

  void _initUsecase(SignUpDataSource datasource) {
    SignUpRepository repository = SignUpRepositoryImpl(datasource: datasource);
    usecase = SignUpUsecaseImpl(repository: repository);
  }

  @action
  Future<void> sendRest() async {
    SignUpRestDatasource datasource =
        SignUpRestDatasource(dio: Modular.get<Dio>());
    _initUsecase(datasource);
    _send();
  }

  @action
  Future<void> sendFirestore() async {
    FirestoreSignUpDatasource datasource = FirestoreSignUpDatasource();
    _initUsecase(datasource);
    _send();
  }

  @action
  Future<void> sendGoogleSignIn() async {
    GoogleSignUpDatasource datasource = GoogleSignUpDatasource();
    _initUsecase(datasource);
    _send();
  }

  @action
  Future<void> _send() async {
    requestFuture = ObservableFuture(usecase(
        param: SignUpParam(name: name, email: email, password: password)));

    var response = await requestFuture;

    response!.fold((failure) {
      errorMessage = failure.message;
    }, (user) {
      userEntity = user;
    });
  }
}
