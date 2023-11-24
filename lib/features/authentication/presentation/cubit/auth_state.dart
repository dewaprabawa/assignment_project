part of 'auth_cubit.dart';

@immutable
class AuthState extends Equatable {
  final AuthProgressStatus authProgressStatus;
  final LoggedInStatus loggedInStatus;
  final String message;
  final bool isSecure;

  const AuthState({this.authProgressStatus = AuthProgressStatus.initial,  this.loggedInStatus = LoggedInStatus.starting, this.message = "", this.isSecure = false});

  AuthState copyWith({
  final AuthProgressStatus? authProgressStatus,
  final LoggedInStatus? loggedInStatus,
   final String? message,
     final bool? isSecure,
  }){
    return AuthState(
      authProgressStatus: authProgressStatus ?? this.authProgressStatus,
      loggedInStatus: loggedInStatus ?? this.loggedInStatus,
      message: message ?? this.message,
      isSecure: isSecure ?? this.isSecure,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    message,
    authProgressStatus,
    loggedInStatus,
    isSecure
  ];
}

enum AuthProgressStatus { initial, loading, failure, success }

enum LoggedInStatus { starting, unauthenticated, authenticated }
