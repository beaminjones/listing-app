// Mocks generated by Mockito 5.4.5 from annotations
// in motel_listing_app/test/motel_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:motel_listing_app/models/category_item.dart' as _i9;
import 'package:motel_listing_app/models/discount.dart' as _i11;
import 'package:motel_listing_app/models/item.dart' as _i8;
import 'package:motel_listing_app/models/motel.dart' as _i5;
import 'package:motel_listing_app/models/period.dart' as _i10;
import 'package:motel_listing_app/models/suite.dart' as _i6;
import 'package:motel_listing_app/services/api_service.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i3.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client =>
      (super.noSuchMethod(
            Invocation.getter(#client),
            returnValue: _FakeClient_0(this, Invocation.getter(#client)),
          )
          as _i2.Client);

  @override
  _i4.Future<List<_i5.Motel>> fetchMotels() =>
      (super.noSuchMethod(
            Invocation.method(#fetchMotels, []),
            returnValue: _i4.Future<List<_i5.Motel>>.value(<_i5.Motel>[]),
          )
          as _i4.Future<List<_i5.Motel>>);
}

/// A class which mocks [Suite].
///
/// See the documentation for Mockito's code generation for more information.
class MockSuite extends _i1.Mock implements _i6.Suite {
  MockSuite() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get name =>
      (super.noSuchMethod(
            Invocation.getter(#name),
            returnValue: _i7.dummyValue<String>(this, Invocation.getter(#name)),
          )
          as String);

  @override
  int get quantity =>
      (super.noSuchMethod(Invocation.getter(#quantity), returnValue: 0) as int);

  @override
  bool get showQuantity =>
      (super.noSuchMethod(Invocation.getter(#showQuantity), returnValue: false)
          as bool);

  @override
  List<String> get photos =>
      (super.noSuchMethod(Invocation.getter(#photos), returnValue: <String>[])
          as List<String>);

  @override
  List<_i8.Item> get items =>
      (super.noSuchMethod(Invocation.getter(#items), returnValue: <_i8.Item>[])
          as List<_i8.Item>);

  @override
  List<_i9.CategoryItem> get categoryItems =>
      (super.noSuchMethod(
            Invocation.getter(#categoryItems),
            returnValue: <_i9.CategoryItem>[],
          )
          as List<_i9.CategoryItem>);

  @override
  List<_i10.Period> get periods =>
      (super.noSuchMethod(
            Invocation.getter(#periods),
            returnValue: <_i10.Period>[],
          )
          as List<_i10.Period>);
}

/// A class which mocks [Item].
///
/// See the documentation for Mockito's code generation for more information.
class MockItem extends _i1.Mock implements _i8.Item {
  MockItem() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get name =>
      (super.noSuchMethod(
            Invocation.getter(#name),
            returnValue: _i7.dummyValue<String>(this, Invocation.getter(#name)),
          )
          as String);
}

/// A class which mocks [CategoryItem].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryItem extends _i1.Mock implements _i9.CategoryItem {
  MockCategoryItem() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get name =>
      (super.noSuchMethod(
            Invocation.getter(#name),
            returnValue: _i7.dummyValue<String>(this, Invocation.getter(#name)),
          )
          as String);

  @override
  String get icon =>
      (super.noSuchMethod(
            Invocation.getter(#icon),
            returnValue: _i7.dummyValue<String>(this, Invocation.getter(#icon)),
          )
          as String);
}

/// A class which mocks [Period].
///
/// See the documentation for Mockito's code generation for more information.
class MockPeriod extends _i1.Mock implements _i10.Period {
  MockPeriod() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get formattedTime =>
      (super.noSuchMethod(
            Invocation.getter(#formattedTime),
            returnValue: _i7.dummyValue<String>(
              this,
              Invocation.getter(#formattedTime),
            ),
          )
          as String);

  @override
  String get time =>
      (super.noSuchMethod(
            Invocation.getter(#time),
            returnValue: _i7.dummyValue<String>(this, Invocation.getter(#time)),
          )
          as String);

  @override
  double get value =>
      (super.noSuchMethod(Invocation.getter(#value), returnValue: 0.0)
          as double);

  @override
  double get totalValue =>
      (super.noSuchMethod(Invocation.getter(#totalValue), returnValue: 0.0)
          as double);

  @override
  bool get hasCourtesy =>
      (super.noSuchMethod(Invocation.getter(#hasCourtesy), returnValue: false)
          as bool);
}

/// A class which mocks [Discount].
///
/// See the documentation for Mockito's code generation for more information.
class MockDiscount extends _i1.Mock implements _i11.Discount {
  MockDiscount() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double get discount =>
      (super.noSuchMethod(Invocation.getter(#discount), returnValue: 0.0)
          as double);
}
