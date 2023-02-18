// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommonState on _CommonState, Store {
  Computed<String>? _$dateRangeTextComputed;

  @override
  String get dateRangeText =>
      (_$dateRangeTextComputed ??= Computed<String>(() => super.dateRangeText,
              name: '_CommonState.dateRangeText'))
          .value;

  late final _$currentRegionAtom =
      Atom(name: '_CommonState.currentRegion', context: context);

  @override
  Region get currentRegion {
    _$currentRegionAtom.reportRead();
    return super.currentRegion;
  }

  @override
  set currentRegion(Region value) {
    _$currentRegionAtom.reportWrite(value, super.currentRegion, () {
      super.currentRegion = value;
    });
  }

  late final _$onlySelRegAtom =
      Atom(name: '_CommonState.onlySelReg', context: context);

  @override
  Region? get onlySelReg {
    _$onlySelRegAtom.reportRead();
    return super.onlySelReg;
  }

  @override
  set onlySelReg(Region? value) {
    _$onlySelRegAtom.reportWrite(value, super.onlySelReg, () {
      super.onlySelReg = value;
    });
  }

  late final _$dateRangeAtom =
      Atom(name: '_CommonState.dateRange', context: context);

  @override
  DateTimeRange? get dateRange {
    _$dateRangeAtom.reportRead();
    return super.dateRange;
  }

  @override
  set dateRange(DateTimeRange? value) {
    _$dateRangeAtom.reportWrite(value, super.dateRange, () {
      super.dateRange = value;
    });
  }

  late final _$dateRangeOnlySelAtom =
      Atom(name: '_CommonState.dateRangeOnlySel', context: context);

  @override
  DateTimeRange get dateRangeOnlySel {
    _$dateRangeOnlySelAtom.reportRead();
    return super.dateRangeOnlySel;
  }

  @override
  set dateRangeOnlySel(DateTimeRange value) {
    _$dateRangeOnlySelAtom.reportWrite(value, super.dateRangeOnlySel, () {
      super.dateRangeOnlySel = value;
    });
  }

  late final _$entityAtom = Atom(name: '_CommonState.entity', context: context);

  @override
  EntityFilter get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(EntityFilter value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$positionAtom =
      Atom(name: '_CommonState.position', context: context);

  @override
  Position? get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position? value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$getCurrentLocationAsyncAction =
      AsyncAction('_CommonState.getCurrentLocation', context: context);

  @override
  Future<void> getCurrentLocation() {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation());
  }

  @override
  String toString() {
    return '''
currentRegion: ${currentRegion},
onlySelReg: ${onlySelReg},
dateRange: ${dateRange},
dateRangeOnlySel: ${dateRangeOnlySel},
entity: ${entity},
position: ${position},
dateRangeText: ${dateRangeText}
    ''';
  }
}
