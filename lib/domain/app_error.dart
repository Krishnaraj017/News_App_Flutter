import 'package:krish_news_app/domain/enums.dart';

class AppError {
  final ErrorType errorType;
  final String? message;
  final int? code;

  AppError({required this.errorType, this.message, this.code});
}
