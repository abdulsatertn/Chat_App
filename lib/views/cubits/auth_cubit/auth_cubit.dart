import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'wrong password'));
      } else if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'user not found'));
      }
    } on Exception catch (e) {
      emit(LoginFailure(errorMessage: 'something went wrong'));
    }
  }

  Future<void> registerUser(String email, String password) async {
    emit(RegisterLoading());

    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'email is already in use'));
      }
    } on Exception catch (e) {
      emit(RegisterFailure(errorMessage: 'something wet wrong try later'));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    print(change);
  }
}
