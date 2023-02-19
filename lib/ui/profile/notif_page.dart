import 'package:flutter/material.dart';
import 'package:studtourizm/theme/theme.dart';

class NotifList extends StatelessWidget {
  const NotifList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Список уведомлений')),
    );
  }
}
