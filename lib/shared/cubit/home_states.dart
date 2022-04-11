abstract class HomeStates {}

class InitialState extends HomeStates {}

class NewsBottomNav extends HomeStates {}

class GetHomeSuccessState extends HomeStates {}

class GetHomeErrorState extends HomeStates {}

class GetHomeLoadingState extends HomeStates {}

class GetFavoriteSuccessState extends HomeStates {}

class GetFavoriteErrorState extends HomeStates {}

class GetFavoriteLoadingState extends HomeStates {}

class GetCartSuccessState extends HomeStates {}

class GetCartErrorState extends HomeStates {}

class GetCartLoadingState extends HomeStates {}

class GetUserSuccessState extends HomeStates {}

class GetUserErrorState extends HomeStates {}

class GetUserLoadingState extends HomeStates {}

class LoginLoadingState extends HomeStates {}

class LoginSuccessState extends HomeStates {
  final String token;

  LoginSuccessState(this.token);
}

class LoginErrorState extends HomeStates {
  late final String error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends HomeStates {}

class RegisterSuccessState extends HomeStates {
  final String token;

  RegisterSuccessState(this.token);
}

class RegisterErrorState extends HomeStates {
  late final String error;

  RegisterErrorState(this.error);
}

class HeartColorState extends HomeStates {}

class TextBoxColorState extends HomeStates {}

class ChangePasswordVisibilityState extends HomeStates {}

class CounterInitialState extends HomeStates {}

class CounterPlusState extends HomeStates {
  final int counter;

  CounterPlusState(this.counter);
}

class CounterMinusState extends HomeStates {
  final int counter;

  CounterMinusState(this.counter);
}

class ChangeSelectedTextState extends HomeStates {}

class ChangeSelectedSizeTextState extends HomeStates {}

class ChangeSelectedShirtColorTextState extends HomeStates {}

class ContainerColorState extends HomeStates {}

class PickImageSuccessState extends HomeStates {}

class ClearImageSuccessState extends HomeStates {}

class GoogleLoadingState extends HomeStates {}

class GoogleSuccessState extends HomeStates {}

class GoogleErrorState extends HomeStates {}
