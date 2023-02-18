import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobx/common/common_state.dart';
import '../../models/filter/filter.dart';
import '../../models/filter/filter_item.dart';
import '../../theme/theme.dart';

class SelectEntityWidget extends StatefulWidget {
  const SelectEntityWidget({super.key});

  @override
  State<SelectEntityWidget> createState() => _SelectEntityWidgetState();
}

class _SelectEntityWidgetState extends State<SelectEntityWidget> {
  final List<EntityFilterItem> _chips = [
    EntityFilterItem(
        name: 'Общежития',
        iconName: 'assets/icons/dormitory.png',
        filterName: EntityFilter.dormitory),
    EntityFilterItem(
        name: 'События',
        iconName: 'assets/icons/event.png',
        filterName: EntityFilter.event),
    EntityFilterItem(
        name: 'Лаборатории',
        iconName: 'assets/icons/lab.png',
        filterName: EntityFilter.lab),
  ];

  @override
  Widget build(BuildContext context) {
    final commonState = Provider.of<CommonState>(context);
    return Observer(builder: (context) {
      return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(width: 16),
            ..._chips
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      onSelected: (isSelected) {
                        if (isSelected) {
                          commonState.entity = item.filterName;
                        }
                        print(commonState.entity.toString());
                        setState(() {});
                      },
                      selected: commonState.entity == item.filterName,
                      label: Text(item.name),
                      avatar: ImageIcon(AssetImage(item.iconName),
                          color: commonState.entity == item.filterName
                              ? mainColor
                              : greyDark),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      );
    });
  }
}
