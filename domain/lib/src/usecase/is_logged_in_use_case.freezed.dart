// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_logged_in_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IsLoggedInInput {}

/// @nodoc
abstract class $IsLoggedInInputCopyWith<$Res> {
  factory $IsLoggedInInputCopyWith(
          IsLoggedInInput value, $Res Function(IsLoggedInInput) then) =
      _$IsLoggedInInputCopyWithImpl<$Res, IsLoggedInInput>;
}

/// @nodoc
class _$IsLoggedInInputCopyWithImpl<$Res, $Val extends IsLoggedInInput>
    implements $IsLoggedInInputCopyWith<$Res> {
  _$IsLoggedInInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IsLoggedInInputImplCopyWith<$Res> {
  factory _$$IsLoggedInInputImplCopyWith(_$IsLoggedInInputImpl value,
          $Res Function(_$IsLoggedInInputImpl) then) =
      __$$IsLoggedInInputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsLoggedInInputImplCopyWithImpl<$Res>
    extends _$IsLoggedInInputCopyWithImpl<$Res, _$IsLoggedInInputImpl>
    implements _$$IsLoggedInInputImplCopyWith<$Res> {
  __$$IsLoggedInInputImplCopyWithImpl(
      _$IsLoggedInInputImpl _value, $Res Function(_$IsLoggedInInputImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IsLoggedInInputImpl implements _IsLoggedInInput {
  const _$IsLoggedInInputImpl();

  @override
  String toString() {
    return 'IsLoggedInInput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsLoggedInInputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _IsLoggedInInput implements IsLoggedInInput {
  const factory _IsLoggedInInput() = _$IsLoggedInInputImpl;
}

/// @nodoc
mixin _$IsLoggedInOutput {
  bool get isLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IsLoggedInOutputCopyWith<IsLoggedInOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsLoggedInOutputCopyWith<$Res> {
  factory $IsLoggedInOutputCopyWith(
          IsLoggedInOutput value, $Res Function(IsLoggedInOutput) then) =
      _$IsLoggedInOutputCopyWithImpl<$Res, IsLoggedInOutput>;
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class _$IsLoggedInOutputCopyWithImpl<$Res, $Val extends IsLoggedInOutput>
    implements $IsLoggedInOutputCopyWith<$Res> {
  _$IsLoggedInOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IsLoggedInOutputImplCopyWith<$Res>
    implements $IsLoggedInOutputCopyWith<$Res> {
  factory _$$IsLoggedInOutputImplCopyWith(_$IsLoggedInOutputImpl value,
          $Res Function(_$IsLoggedInOutputImpl) then) =
      __$$IsLoggedInOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class __$$IsLoggedInOutputImplCopyWithImpl<$Res>
    extends _$IsLoggedInOutputCopyWithImpl<$Res, _$IsLoggedInOutputImpl>
    implements _$$IsLoggedInOutputImplCopyWith<$Res> {
  __$$IsLoggedInOutputImplCopyWithImpl(_$IsLoggedInOutputImpl _value,
      $Res Function(_$IsLoggedInOutputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
  }) {
    return _then(_$IsLoggedInOutputImpl(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsLoggedInOutputImpl extends _IsLoggedInOutput {
  const _$IsLoggedInOutputImpl({this.isLoggedIn = false}) : super._();

  @override
  @JsonKey()
  final bool isLoggedIn;

  @override
  String toString() {
    return 'IsLoggedInOutput(isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsLoggedInOutputImpl &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsLoggedInOutputImplCopyWith<_$IsLoggedInOutputImpl> get copyWith =>
      __$$IsLoggedInOutputImplCopyWithImpl<_$IsLoggedInOutputImpl>(
          this, _$identity);
}

abstract class _IsLoggedInOutput extends IsLoggedInOutput {
  const factory _IsLoggedInOutput({final bool isLoggedIn}) =
      _$IsLoggedInOutputImpl;
  const _IsLoggedInOutput._() : super._();

  @override
  bool get isLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$IsLoggedInOutputImplCopyWith<_$IsLoggedInOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
