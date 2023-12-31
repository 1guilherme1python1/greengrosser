import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';

import '../../common_widgets/app_name_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  //controlador de campos de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_textRichLogo(), _animationText()])),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _customTextFiedEmail(),
                      _customTextFieldPassword(),
                      _buttonEnter(context),
                      _forgotPassword(),
                      _dividerFields(),
                      _createAnAccount(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // logo texto
  _textRichLogo() {
    return const AppNameWidget(
      greenTitleColor: Colors.white,
      textSize: 40,
    );
  }

  //animacao texto
  _animationText() {
    return SizedBox(
      height: 30,
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 25),
        child: AnimatedTextKit(
            pause: Duration.zero,
            repeatForever: true,
            animatedTexts: [
              FadeAnimatedText('Frutas'),
              FadeAnimatedText('Verduras'),
              FadeAnimatedText('Legumes'),
              FadeAnimatedText('Carnes'),
              FadeAnimatedText('Cereais'),
              FadeAnimatedText('Laticineos'),
            ]),
      ),
    );
  }

  //campo de email
  _customTextFiedEmail() {
    return CustomTextField(
      controller: emailController,
      icon: Icons.email,
      label: 'Email',
      validator: (email) {
        if (email == null || email.isEmpty) {
          return 'Digite seu email';
        }

        if (!email.isEmail) {
          return 'Digite um email valido';
        }

        return null;
      },
    );
  }

  //campo de senha
  _customTextFieldPassword() {
    return CustomTextField(
      controller: passwordController,
      icon: Icons.lock,
      label: 'Senha',
      isSecret: true,
      validator: (password) {
        if (password == null || password.isEmpty) {
          return 'Digite sua senha';
        }

        if (password.length < 7) {
          return 'Digite uma senha com pelo menos 7 caracteres';
        }

        return null;
      },
    );
  }

  //botao de entrar
  _buttonEnter(BuildContext context) {
    return SizedBox(
        height: 50,
        child: GetX<AuthController>(
          builder: (authController) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              )),
              onPressed: authController.isLoading.value
                  ? null // caso esteja carregando o campo ficara desabilidado
                  : () {

                    FocusScope.of(context).unfocus(); // desabilita o teclado

                      if (_formKey.currentState!.validate()) {
                        authController.singIn(
                            email: emailController.text,
                            password: passwordController.text);
                        print(authController);

                        // Get.offNamed(PageRoutes.baseScreenRoute);
                      }
                    },
              child: authController.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18),
                    ),
            );
          },
        ));
  }

  //botao de esqueci senha
  _forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {},
          child: Text(
            'Esqueceu a senha ?',
            style: TextStyle(color: CustomColors.customContrastColor),
          )),
    );
  }

  //divisor de campos entrar e criar conta
  _dividerFields() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
              thickness: 2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Ou',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }

  //botao criar conta
  _createAnAccount(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              side: const BorderSide(
                width: 2,
                color: Colors.green,
              )),
          onPressed: () {
            Get.toNamed(PageRoutes.signUpRoute);
          },
          child: const Text(
            'Criar Conta',
            style: TextStyle(fontSize: 18),
          )),
    );
  }
}
