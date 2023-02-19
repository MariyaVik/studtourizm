import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobx/common/common_state.dart';
import '../../models/filter/filter.dart';
import '../../theme/theme.dart';
import '../events/event_list.dart';
import '../places/places_list.dart';
import 'drop_down_botton.dart';
import 'select_date_button.dart';
import 'select_entity.dart';

class FiltersPlace extends StatelessWidget {
  const FiltersPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectDateButton(),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset('assets/icons/filter.png'),
              SelectWidget(
                hint: 'ВУЗ',
                listItem: MealFilterName.list,
              ),
              SizedBox(width: 8),
              SelectWidget(
                hint: 'Питание',
                listItem: MealFilterName.list,
              ),
              SizedBox(width: 8),
              SelectWidget(
                hint: 'Тип размещения',
                listItem: MealFilterName.list,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController sc;
  const PanelWidget({required this.sc, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: sc,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: greyLight,
            ),
            height: 8,
            width: 50,
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FiltersPlace(),
        ),
        Divider(),
        Observer(builder: (context) {
          return Expanded(
            child:
                Provider.of<CommonState>(context).entity == EntityFilter.event
                    ? EventsListWidget(controller: sc)
                    : PlacesListWidget(controller: sc),
          );
        })
      ],
    );
  }
}
