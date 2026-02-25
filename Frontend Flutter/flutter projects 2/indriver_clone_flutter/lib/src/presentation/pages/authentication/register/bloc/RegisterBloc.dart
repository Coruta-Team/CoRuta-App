import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFomItem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formkey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formkey: formkey));
    });

    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isEmpty ? 'Ingresa el nombre' : null,
          ),
          formkey: formkey,
        ),
      );
    });
    on<LastnameChanged>((event, emit) {
      emit(
        state.copyWith(
          lastname: BlocFormItem(
            value: event.lastname.value,
            error: event.lastname.value.isEmpty ? 'Ingresa el apedillo' : null,
          ),
          formkey: formkey,
        ),
      );
    });
    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingresa el email' : null,
          ),
          formkey: formkey,
        ),
      );
    });
    on<PhoneChanged>((event, emit) {
      emit(
        state.copyWith(
          phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isEmpty ? 'Ingresa el telefono' : null,
          ),
          formkey: formkey,
        ),
      );
    });
    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isEmpty
                ? 'Ingresa el Password'
                : event.password.value.length < 6
                ? 'Mas de 6 Caracteres'
                : null,
          ),
          formkey: formkey,
        ),
      );
    });
    on<ConfirmPasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: BlocFormItem(
            value: event.confirmPassword.value,
            error: event.confirmPassword.value.isEmpty
                ? 'Confirmar el Password'
                : event.confirmPassword.value.length < 6
                ? 'Mas de 6 Caracteres'
                : event.confirmPassword.value != state.password.value
                ? 'Los password no coinciden'
                : null,
          ),
          formkey: formkey,
        ),
      );
    });

    on<FormSubmit>((event, emit) {
      print('Name: ${state.name.value}');
      print('lastname: ${state.lastname.value}');
      print('email: ${state.email.value}');
      print('phone: ${state.phone.value}');
      print('password: ${state.password.value}');
      print('confirmPassword: ${state.confirmPassword.value}');
    });
    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });
  }
}
