import "package:firebase_auth/firebase_auth.dart";

class authentication{
  final FirebaseAuth _firebaseAuth;
  authentication(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<void>SignOut() async{
    await _firebaseAuth.signOut();
  }
  Future<String> SignIn({String email, String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);


    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
  Future<String> SignUp({String email, String password , String confirmpassword}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}