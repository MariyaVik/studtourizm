import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/mobx/events/events_state.dart';

import '../../mobx/common/common_state.dart';
import '../../theme/theme.dart';

class SelectDateButton extends StatefulWidget {
  const SelectDateButton({Key? key}) : super(key: key);

  @override
  State<SelectDateButton> createState() => _SelectDateButtonState();
}

class _SelectDateButtonState extends State<SelectDateButton> {
  @override
  Widget build(BuildContext context) {
    Future pickDateRange() async {
      final commonState = Provider.of<CommonState>(context, listen: false);
      DateTimeRange? newDateRange = await showDateRangePicker(
          context: context,
          initialDateRange: commonState.dateRangeOnlySel,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100));
      commonState.dateRange = newDateRange;
      await Provider.of<EventsState>(context, listen: false).loadEvents(
          from: newDateRange!.start.millisecondsSinceEpoch,
          to: newDateRange.end.millisecondsSinceEpoch);
      print(newDateRange.start.millisecondsSinceEpoch.toString());
      print(newDateRange.end.millisecondsSinceEpoch.toString());
      setState(() {});
    }

    return Observer(builder: (context) {
      final commonState = Provider.of<CommonState>(context);
      return GestureDetector(
        onTap: () {
          pickDateRange();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: greyMegaLight, borderRadius: BorderRadius.circular(5)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Image.asset('assets/icons/cal.png'),
            const SizedBox(width: 8),
            Text(commonState.dateRangeText),
          ]),
        ),
      );
    });
  }
}
