import 'package:edge_delivery/modules/sign_up_module/data/datasources/sign_up_datasource.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/usecase/sign_up_usecase.dart';
import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignUpDatasource implements SignUpDataSource {
  @override
  Future<UserEntity?> signUp(SignUpParam param) async {
    GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ["email"]).signIn();

    if (googleUser != null) {
      Map<String, dynamic> googleData = {
        "name": googleUser.displayName,
        "photoUrl": googleUser.photoUrl,
        "email": googleUser.email,
        "googleId": googleUser.id,
      };

      return UserEntity.fromGoogle(googleData);
    }

    return null;
  }
}
