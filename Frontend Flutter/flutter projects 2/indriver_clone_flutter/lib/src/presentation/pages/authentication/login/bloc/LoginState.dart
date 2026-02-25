import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFomItem.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.email = const BlocFormItem(error: 'Ingresa el imail'),
    this.password = const BlocFormItem(error: 'Ingresa el password'),
    this.formKey,
  });

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    BlocFormItem? password,
    BlocFormItem? email,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [email, password];
}
