// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommonState on _CommonState, Store {
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
entity: ${entity},
position: ${position}
    ''';
  }
}
