abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String userName;

  const UserNameEvent({required this.userName});
}

class EmailEvent extends RegisterEvent {
  final String email;

  const EmailEvent({required this.email});
}

class PasswordEvent extends RegisterEvent {
  final String password;

  const PasswordEvent({required this.password});
}

class ConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;

  const ConfirmPasswordEvent({required this.confirmPassword});
}
