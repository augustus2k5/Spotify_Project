import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<void> signIn();

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
  Future<void> signIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
}
