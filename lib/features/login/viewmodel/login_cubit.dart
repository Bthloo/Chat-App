import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/api_manager/api_manager.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  login()async{
    if(formKey.currentState!.validate() == false){
      return;
    }else{
      emit(LoginLoading());
      try {
        var response = await ApiManager.login(
          email: emailController.text,
          password: passwordController.text,
        );
        if(response.success!){
          emit(LoginSuccess('Login Success'));
        }else{
          emit(LoginError(response.message!));
        }
      } catch (ex) {
        emit(LoginError('$ex'));
      }
    }
}
}
