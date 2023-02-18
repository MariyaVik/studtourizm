import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../models/filter/filter.dart';
import '../../services/get_user_geo.dart';

part 'common_state.g.dart';

class CommonState = _CommonState with _$CommonState;

abstract class _CommonState with Store {
  final UserGeo userGeo;
  _CommonState(this.userGeo) {
    getCurrentLocation();
  }

  @observable
  DateTimeRange? dateRange;

  @observable
  EntityFilter entity = EntityFilter.dormitory;

  @observable
  Position? position;

  @computed
  String get dateRangeText =>
      dateRange == null ? 'Выбрать даты' : dateRange.toString();

  @action
  Future<void> getCurrentLocation() async {
    position = await userGeo.getGeo().then((polsition) => polsition);
  }
}
