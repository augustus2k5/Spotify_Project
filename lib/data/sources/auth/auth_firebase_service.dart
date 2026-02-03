import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SigninUserRequest signinUserRequest);

  Future<Either> signUp(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return const Right("Signup was successful");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if(e.code == "weak-password") { 
        message = "The password provided is too weak";
      } else if(e.code == "email-already-in-use") {
        message = "An account already exists with that email";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signIn(SigninUserRequest signinUserRequest) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserRequest.email,
        password: signinUserRequest.password,
      );

      return const Right("Signin was successful");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if(e.code == "invalid-email") { 
        message = "Not user found for that email";
      } else if(e.code == "invalid-credential") {
        message = "Wrong password provided for that user";
      }

      return Left(message);
    }
  }
}
