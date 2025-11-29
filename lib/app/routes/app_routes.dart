// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const AUTH = _Paths.AUTH;
  static const VERIFY = _Paths.VERIFY;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const LOGIN = '/auth/login';
  static const REGISTER = '/auth/register';
  static const VERIFY = '/auth/verify';
}
