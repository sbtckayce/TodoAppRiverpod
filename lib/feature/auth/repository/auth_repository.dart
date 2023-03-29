import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_riverpod/models/user/user_model.dart';
import 'package:todo_riverpod/provider/firebase_provider.dart';
import 'package:todo_riverpod/shared/constants/firebase_collections.dart';
import 'package:todo_riverpod/shared/constants/image_link.dart';
import 'package:todo_riverpod/shared/failue.dart';
import 'package:todo_riverpod/shared/type_defs.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
    firebaseAuth: ref.watch(firebaseAuthProvider),
    googleSignIn: ref.watch(googleSignInProvider)));

class AuthRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {required FirebaseFirestore firebaseFirestore,
      required FirebaseAuth firebaseAuth,
      required GoogleSignIn googleSignIn})
      : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firebaseFirestore.collection(FirebaseCollection.usersCollection);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final googleAuth = await googleSignInAccount?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: userCredential.user!.displayName ?? 'No name',
            profilePic:
                userCredential.user!.photoURL ?? ImageLink.avatarDefault,
            uid: userCredential.user!.uid,
            isAuthenticted: true);
        await _users.doc(userCredential.user!.uid).set(userModel.toJson());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }
      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failue(message: e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromJson(event.data() as Map<String, dynamic>));
  }
   void logOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
