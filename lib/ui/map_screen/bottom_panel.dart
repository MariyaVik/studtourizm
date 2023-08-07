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

class FiltersPlace extends StatelessWidget {
  const FiltersPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SelectDateButton(),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset('assets/icons/filter.png'),
              const SelectWidget(
                hint: 'ВУЗ',
                listItem: MealFilterName.list,
              ),
              const SizedBox(width: 8),
              const SelectWidget(
                hint: 'Питание',
                listItem: MealFilterName.list,
              ),
              const SizedBox(width: 8),
              const SelectWidget(
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
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: FiltersPlace(),
        ),
        const Divider(),
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
