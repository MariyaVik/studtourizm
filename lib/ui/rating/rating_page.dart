import 'package:flutter/material.dart';
import 'package:studtourizm/services/rating_api.dart';

import '../../theme/theme.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  Map leaderBord = {};

  bool done = false;

  void getRat() async {
    leaderBord = await getRating().whenComplete(() {
      done = true;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getRat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Рейтинговая таблица',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 15),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Топ-30 активных студентов',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20, color: const Color(0xFF676767)),
            ),
          ),
          const SizedBox(height: 20),
          done
              ? Expanded(
                  child: ListView.builder(
                      itemCount: leaderBord.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: RatingRow(
                            index: index,
                            name: leaderBord.keys.toList()[index],
                            score: leaderBord.values.toList()[index],
                          ),
                        );
                      }),
                )
              : const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text('Таблица обновляется раз в год',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: const Color(0xFF8e8e8e))),
          ),
        ],
      ),
    );
  }
}

class RatingRow extends StatelessWidget {
  final int index;
  final String name;
  final String score;
  const RatingRow(
      {required this.index,
      required this.name,
      required this.score,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: 24,
          child: Text(
            '${index + 1}',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              backgroundColor: greyLight,
              child: Icon(
                Icons.camera_alt_outlined,
                color: greyDark,
              ),
            ),
            if (index < 3)
              Positioned(right: 0, bottom: -5, child: medal(index)),
          ],
        ),
        SizedBox(width: 8),
        Expanded(
            child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
        )),
        Text(
          '$score баллов',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget medal(int index) {
    late Color color;
    switch (index) {
      case 0:
        color = Color(0xFFFFD43D);
        break;
      case 1:
        color = Color(0xFFCACACA);
        break;
      case 2:
        color = Color(0xFFC96933);
        break;
    }
    return ImageIcon(
      AssetImage('assets/icons/achiev.png'),
      color: color,
    );
  }
}
