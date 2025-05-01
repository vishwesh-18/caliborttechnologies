abstract class RegisterEvent{
  const RegisterEvent();
}
class UsernameEvent extends RegisterEvent{
  final String userName;
  const UsernameEvent(this.userName);
}

class EmailEventR extends RegisterEvent{
  final String email;
  const EmailEventR(this.email);
}

class PasswordEventR extends RegisterEvent{
  final String password;
  const PasswordEventR(this.password);
}

class RePasswordEvent extends RegisterEvent{
  final String rePassword;
  const RePasswordEvent(this.rePassword);
}
