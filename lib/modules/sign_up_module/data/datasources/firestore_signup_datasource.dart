import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:edge_delivery/modules/sign_up_module/data/datasources/sign_up_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:edge_delivery/modules/sign_up_module/failures/signup_failure.dart';

class FirestoreSignUpDatasource implements SignUpDataSource {
  late FirebaseFirestore db;

  FirestoreSignUpDatasource() {
    db = FirebaseFirestore.instance;
  }

  @override
  Future<Either<SignUpFailure, UserEntity>> signUp({SignUpParam? param}) async {
    QuerySnapshot<Map<String, dynamic>> usersCollection =
        await db.collection('users').get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> eachUserDoc
        in usersCollection.docs) {
      var userMap = eachUserDoc.data();

      if (userMap['email'] == param!.email) {
        return left(SignUpFailure(message: 'Usuário com email já existente!'));
      }
    }

    DocumentReference<Map<String, dynamic>> response = await db
        .collection('users')
        .add({
      'name': param!.name,
      'email': param.email,
      'password': param.password
    });

    return right(
        UserEntity(id: response.id, name: param.name, email: param.email));
  }
}
