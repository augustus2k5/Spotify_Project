import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';

abstract class AuthRepository {

  Future<Either> signIn(SigninUserRequest signinUserRequest);

  Future<Either> signUp(CreateUserReq createUserReq);
}