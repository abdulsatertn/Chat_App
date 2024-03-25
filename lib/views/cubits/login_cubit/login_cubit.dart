import 'package:bloc/bloc.dart';
import 'package:chat_app_second/helper/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

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
}
