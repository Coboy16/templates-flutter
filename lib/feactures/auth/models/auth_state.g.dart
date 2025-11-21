// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
  currentTemplate: json['currentTemplate'] as String? ?? 'template1',
  showGoogle: json['showGoogle'] as bool? ?? true,
  showApple: json['showApple'] as bool? ?? true,
  showTerms: json['showTerms'] as bool? ?? true,
  backgroundImage: json['backgroundImage'] as String?,
);

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'currentTemplate': instance.currentTemplate,
      'showGoogle': instance.showGoogle,
      'showApple': instance.showApple,
      'showTerms': instance.showTerms,
      'backgroundImage': instance.backgroundImage,
    };
