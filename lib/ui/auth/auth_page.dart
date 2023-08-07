import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/mobx/common/common_state.dart';

import '../../theme/theme.dart';
import '../common/big_full_logo.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<CommonState>(context, listen: false).user;
    return Scaffold(
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const BigFullLogo(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _buildEmailField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _buildPasswordField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _buildSubmitButton(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                    onPressed: () {}, child: const Text('Регистрация')),
              )
            ],
          ),
        ));
  }

  Widget _buildEmailField() {
    return TextFormField(
      initialValue: 'ivan@mail.ru',
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
        fillColor: greyLight.withOpacity(0.8),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: backColor),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: backColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Поле обязательно для заполнения';
        } else if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Введён некорректный адрес';
        }
        return null;
      },
      onSaved: (String? value) {
        Provider.of<CommonState>(context, listen: false).user.email = value;
      },
      textInputAction: TextInputAction.next,
      // onFieldSubmitted: (v) {
      //   FocusScope.of(context).requestFocus(focusPassword);
      // },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      initialValue: '123123',
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Пароль',
        filled: true,
        fillColor: greyLight.withOpacity(0.8),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: backColor),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: backColor),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (String? value) {
        if (value == null || value == '') {
          return 'Поле обязательно для заполнения';
        }
        return null;
      },
      onSaved: (String? value) {
        Provider.of<CommonState>(context, listen: false).user.password = value;
      },
      // focusNode: focusPassword,
      onFieldSubmitted: (v) {
        _submitForm();
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        _submitForm();
      },
      child: const Text('Войти'),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(Provider.of<CommonState>(context, listen: false).user);
      Provider.of<CommonState>(context, listen: false).isAuth = true;
      Navigator.of(context).pop();
    }
  }
}
