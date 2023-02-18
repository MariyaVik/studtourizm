import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobx/common/common_state.dart';
import '../../models/filter/filter.dart';
import '../../theme/theme.dart';
import '../events/event_list.dart';
import '../places/places_list.dart';
import 'select_entity.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.75,
      builder: (BuildContext context, ScrollController scrollController) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: greyLight,
                    ),
                    height: 8,
                    width: 50,
                  ),
                  const SelectEntityWidget(),
                  Observer(builder: (context) {
                    return Expanded(
                      child: Provider.of<CommonState>(context).entity ==
                              EntityFilter.event
                          ? EventsListWidget(controller: scrollController)
                          : PlacesListWidget(
                              controller: scrollController,
                            ),
                    );
                  })
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
