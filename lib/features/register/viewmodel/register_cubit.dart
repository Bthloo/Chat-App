import 'package:chat_app_hono/core/api_manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  register() async {
    if(formKey.currentState!.validate() == false){
      return;
    }else{
      emit(RegisterLoading());
      try {
       var response = await ApiManager.register(
          email: emailController.text,
          password: passwordController.text,
          username: userNameController.text,
        );
       if(response.success!){
         emit(RegisterSuccess('Register Success'));
       }else{
         emit(RegisterError(response.message!));
       }

      } catch (ex) {
        emit(RegisterError('$ex'));
      }
    }

  }
}
