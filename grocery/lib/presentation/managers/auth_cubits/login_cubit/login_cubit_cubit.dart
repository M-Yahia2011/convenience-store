// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';


part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit(this._signInUsecase) : super(LoginCubitInitial());

  final _signInUsecase;
  // Future<void> singIn({required Map<String, dynamic> userData}) async {
  //   emit(LoginLoading());

  //   var result = await _signInUsecase.execute(userData);
  //   result.fold((failure) => emit(LoginFailure(failure.message)),
  //       (user) => emit(LoginSuccess(user)));
  // }
}
