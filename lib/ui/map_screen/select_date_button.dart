import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/mobx/common/common_state.dart';

class SelectDateButton extends StatelessWidget {
  const SelectDateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final commonState = Provider.of<CommonState>(context);
      return ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              ImageIcon(AssetImage('assets/icons/cal.png')),
              Text(commonState.dateRangeText),
            ],
          ));
    });
  }
}
