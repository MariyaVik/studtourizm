import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/theme/theme.dart';

import '../../mobx/common/common_state.dart';

class NotifList extends StatelessWidget {
  const NotifList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        GestureDetector(
            onTap: () {
              Provider.of<CommonState>(context, listen: false).updateTab(2);
            },
            child: NotifCard()),
      ]),
    );
  }
}

class NotifCard extends StatelessWidget {
  const NotifCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Экскурсия в Институт искусственного интеллекта',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 14)),
        SizedBox(height: 16),
        Container(
          // margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: greyDark)),
          child: Text('Ваша заявка одобрена!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14)),
        ),
      ],
    );
  }
}
