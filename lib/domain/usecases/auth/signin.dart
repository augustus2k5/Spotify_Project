import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUserRequest>{

  @override
  Future<Either<dynamic, dynamic>> call({SigninUserRequest? params}) async{
    return await sl<AuthRepository>().signIn(params!);
  }

}