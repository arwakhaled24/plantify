abstract class LogInViewStates{}
class InitialState extends LogInViewStates{}
class LoadingState extends LogInViewStates{}
class ErrorState extends LogInViewStates{
  String errorMessagee;
  ErrorState({required this.errorMessagee});
}
class SuccssState extends LogInViewStates{
  String mes ;
  SuccssState (this.mes);
}
