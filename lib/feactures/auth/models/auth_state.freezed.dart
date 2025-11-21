// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState {

 String get currentTemplate; bool get showGoogle; bool get showApple; bool get showTerms; String? get backgroundImage;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);

  /// Serializes this AuthState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.currentTemplate, currentTemplate) || other.currentTemplate == currentTemplate)&&(identical(other.showGoogle, showGoogle) || other.showGoogle == showGoogle)&&(identical(other.showApple, showApple) || other.showApple == showApple)&&(identical(other.showTerms, showTerms) || other.showTerms == showTerms)&&(identical(other.backgroundImage, backgroundImage) || other.backgroundImage == backgroundImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentTemplate,showGoogle,showApple,showTerms,backgroundImage);

@override
String toString() {
  return 'AuthState(currentTemplate: $currentTemplate, showGoogle: $showGoogle, showApple: $showApple, showTerms: $showTerms, backgroundImage: $backgroundImage)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 String currentTemplate, bool showGoogle, bool showApple, bool showTerms, String? backgroundImage
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTemplate = null,Object? showGoogle = null,Object? showApple = null,Object? showTerms = null,Object? backgroundImage = freezed,}) {
  return _then(_self.copyWith(
currentTemplate: null == currentTemplate ? _self.currentTemplate : currentTemplate // ignore: cast_nullable_to_non_nullable
as String,showGoogle: null == showGoogle ? _self.showGoogle : showGoogle // ignore: cast_nullable_to_non_nullable
as bool,showApple: null == showApple ? _self.showApple : showApple // ignore: cast_nullable_to_non_nullable
as bool,showTerms: null == showTerms ? _self.showTerms : showTerms // ignore: cast_nullable_to_non_nullable
as bool,backgroundImage: freezed == backgroundImage ? _self.backgroundImage : backgroundImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentTemplate,  bool showGoogle,  bool showApple,  bool showTerms,  String? backgroundImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.currentTemplate,_that.showGoogle,_that.showApple,_that.showTerms,_that.backgroundImage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentTemplate,  bool showGoogle,  bool showApple,  bool showTerms,  String? backgroundImage)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.currentTemplate,_that.showGoogle,_that.showApple,_that.showTerms,_that.backgroundImage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentTemplate,  bool showGoogle,  bool showApple,  bool showTerms,  String? backgroundImage)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.currentTemplate,_that.showGoogle,_that.showApple,_that.showTerms,_that.backgroundImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthState implements AuthState {
  const _AuthState({this.currentTemplate = 'template1', this.showGoogle = true, this.showApple = true, this.showTerms = true, this.backgroundImage});
  factory _AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);

@override@JsonKey() final  String currentTemplate;
@override@JsonKey() final  bool showGoogle;
@override@JsonKey() final  bool showApple;
@override@JsonKey() final  bool showTerms;
@override final  String? backgroundImage;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.currentTemplate, currentTemplate) || other.currentTemplate == currentTemplate)&&(identical(other.showGoogle, showGoogle) || other.showGoogle == showGoogle)&&(identical(other.showApple, showApple) || other.showApple == showApple)&&(identical(other.showTerms, showTerms) || other.showTerms == showTerms)&&(identical(other.backgroundImage, backgroundImage) || other.backgroundImage == backgroundImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentTemplate,showGoogle,showApple,showTerms,backgroundImage);

@override
String toString() {
  return 'AuthState(currentTemplate: $currentTemplate, showGoogle: $showGoogle, showApple: $showApple, showTerms: $showTerms, backgroundImage: $backgroundImage)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 String currentTemplate, bool showGoogle, bool showApple, bool showTerms, String? backgroundImage
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTemplate = null,Object? showGoogle = null,Object? showApple = null,Object? showTerms = null,Object? backgroundImage = freezed,}) {
  return _then(_AuthState(
currentTemplate: null == currentTemplate ? _self.currentTemplate : currentTemplate // ignore: cast_nullable_to_non_nullable
as String,showGoogle: null == showGoogle ? _self.showGoogle : showGoogle // ignore: cast_nullable_to_non_nullable
as bool,showApple: null == showApple ? _self.showApple : showApple // ignore: cast_nullable_to_non_nullable
as bool,showTerms: null == showTerms ? _self.showTerms : showTerms // ignore: cast_nullable_to_non_nullable
as bool,backgroundImage: freezed == backgroundImage ? _self.backgroundImage : backgroundImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
