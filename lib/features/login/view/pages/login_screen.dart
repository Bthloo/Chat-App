import 'package:chat_app_hono/features/register/view/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/general_components/build_show_toast.dart';
import '../../../../core/general_components/custom_form_field.dart';
import '../../../../core/general_components/my_validators.dart';
import '../../viewmodel/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
static const String routeName = 'login screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              buildShowToast(state.message);
            }else if(state is LoginError){
              buildShowToast(state.message);
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
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

                      state is LoginLoading ? const CircularProgressIndicator() :
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              cubit.login();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have an Account ? ",
                            style: TextStyle(
                              color: Color(0xffEDEDED),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RegisterScreen.routeName);
                              },
                              child: const Text("Register")),
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
