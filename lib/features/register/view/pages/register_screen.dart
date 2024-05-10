import 'package:chat_app_hono/core/general_components/build_show_toast.dart';
import 'package:chat_app_hono/core/general_components/custom_form_field.dart';
import 'package:chat_app_hono/features/register/viewmodel/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/general_components/my_validators.dart';
import '../../../login/view/pages/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = 'register screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              buildShowToast(state.message);
            }else if(state is RegisterError){
              buildShowToast(state.message);
            }
          },
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text('App Name',
                          style: TextStyle(
                              fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white

                          )),
                      SizedBox(height: 20.h),
                      CustomFormField(
                          hintText: "Enter Your Name",
                          validator: (value) => MyValidators.nameValidator(value),
                          controller: cubit.userNameController),
                      SizedBox(height: 20.h),
                      CustomFormField(
                        keyboardType: TextInputType.emailAddress,
                          hintText: "Enter Your Email",
                          validator: (value) =>
                              MyValidators.emailValidator(value),
                          controller: cubit.emailController),
                      SizedBox(height: 20.h),
                      CustomFormField(
                        isPassword: true,
                          hintText: "Enter Your Password",
                          validator: (value) =>
                              MyValidators.passwordValidator(value),
                          controller: cubit.passwordController),
                      SizedBox(height: 20.h),
                      CustomFormField(
                          isPassword: true,
                          hintText: "Re Enter Your Password",
                          validator: (value) =>
                              MyValidators.repeatPasswordValidator(
                                value: value,
                                password: cubit.passwordController.text,
                              ),
                          controller: cubit.confirmPasswordController),
                      SizedBox(height: 50.h),
                      state is RegisterLoading ? const CircularProgressIndicator() :
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                cubit.register();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have an Account ? ",
                            style: TextStyle(
                              color: Color(0xffEDEDED),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: const Text("Login")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
