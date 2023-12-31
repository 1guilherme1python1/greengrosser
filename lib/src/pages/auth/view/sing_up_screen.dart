import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../common_widgets/custom_text_field.dart';

class SingUpScreen extends StatelessWidget {
   SingUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

   final numberFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 32),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _customTextFiedEmail(),
                        _customTextFieldPassword(),
                        _customTextFiedName(),
                        _customTextFiedPhoneNumber(numberFormatter),
                        _customTextFiedCpf(cpfFormatter),
                        _buttonSignUp(context),
                      ],
                    ),
                  )
                ],
              ),
              _backButton(context)
            ],
          ),
        ),
      ),
    );
  }

  _backButton(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: SafeArea(
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
    );
  }

  _customTextFiedEmail() {
    return const CustomTextField(
      icon: Icons.email,
      label: 'Email',
    );
  }

  _customTextFieldPassword() {
    return const CustomTextField(
        icon: Icons.lock, label: 'Senha', isSecret: true);
  }

  _customTextFiedName() {
    return const CustomTextField(
      icon: Icons.person,
      label: 'Nome',
    );
  }

  _customTextFiedPhoneNumber(numberFormatter) {
    return CustomTextField(
      icon: Icons.phone,
      label: 'Celular',
       inputFormatters: [numberFormatter]
    );
  }

  _customTextFiedCpf(cpfFormatter) {
    return CustomTextField(
      icon: Icons.file_copy,
      label: 'CPF',
      inputFormatters: [cpfFormatter],
    );
  }

  _buttonSignUp(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            )),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cadastrar',
              style: TextStyle(fontSize: 18),
            )));
  }
}
