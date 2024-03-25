import 'package:bloc/bloc.dart';
import 'package:chat_app_second/helper/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

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
}
