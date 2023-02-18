// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventsState on _EventsState, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_EventsState.isLoading'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_EventsState.hasError'))
      .value;

  late final _$eventsAtom = Atom(name: '_EventsState.events', context: context);

  @override
  List<Event> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<Event> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$errorAtom = Atom(name: '_EventsState.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadEventsAsyncAction =
      AsyncAction('_EventsState.loadEvents', context: context);

  @override
  Future<void> loadEvents({int from = 0, int to = 0}) {
    return _$loadEventsAsyncAction
        .run(() => super.loadEvents(from: from, to: to));
  }

  late final _$loadAllEventsAsyncAction =
      AsyncAction('_EventsState.loadAllEvents', context: context);

  @override
  Future<void> loadAllEvents() {
    return _$loadAllEventsAsyncAction.run(() => super.loadAllEvents());
  }

  late final _$loadAEventsInDateAsyncAction =
      AsyncAction('_EventsState.loadAEventsInDate', context: context);

  @override
  Future<void> loadAEventsInDate(int from, int to) {
    return _$loadAEventsInDateAsyncAction
        .run(() => super.loadAEventsInDate(from, to));
  }

  @override
  String toString() {
    return '''
events: ${events},
error: ${error},
isLoading: ${isLoading},
hasError: ${hasError}
    ''';
  }
}
