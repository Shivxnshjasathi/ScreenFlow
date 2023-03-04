// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';


abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DETAIL_MOVIE = _Paths.DETAIL_MOVIE;
  static const DETAIL_PERSON = _Paths.DETAIL_PERSON;
  static const SEARCH_PAGE = _Paths.SEARCH_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const DETAIL_MOVIE = '/detail-movie';
  static const DETAIL_PERSON = '/detail-person';
  static const SEARCH_PAGE = '/search-page';
}
