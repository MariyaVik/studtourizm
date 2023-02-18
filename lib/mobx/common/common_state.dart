import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../models/filter/filter.dart';
import '../../models/region/region.dart';
import '../../services/get_user_geo.dart';
import '../../ui/utils.dart';

part 'common_state.g.dart';

class CommonState = _CommonState with _$CommonState;

abstract class _CommonState with Store {
  final UserGeo userGeo;
  _CommonState(this.userGeo) {
    // getCurrentLocation();
  }

  @observable
  Region currentRegion =
      Region(code: 77, name: 'Москва', codeISO: RegionAbb.msk);
  @observable
  Region? onlySelReg;

  @observable
  DateTimeRange? dateRange;

  @observable
  DateTimeRange dateRangeOnlySel =
      DateTimeRange(start: DateTime.now(), end: DateTime.utc(2023, 6, 2));

  @observable
  EntityFilter entity = EntityFilter.dormitory;

  @observable
  Position? position;

  @computed
  String get dateRangeText => dateRange == null
      ? 'Выбрать даты'
      : '${dateFormat(dateRange!.start)} - ${dateFormat(dateRange!.end)}';

  @action
  Future<void> getCurrentLocation() async {
    position = await userGeo.getGeo().then((polsition) => polsition);
  }
}
