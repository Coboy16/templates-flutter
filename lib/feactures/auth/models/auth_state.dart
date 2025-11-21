import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default('template1') String currentTemplate,
    @Default(true) bool showGoogle,
    @Default(true) bool showApple,
    @Default(true) bool showTerms,
    String? backgroundImage,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
