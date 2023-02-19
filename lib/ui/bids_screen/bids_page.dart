import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../mobx/common/common_state.dart';
import '../../theme/theme.dart';

class BidsPage extends StatelessWidget {
  const BidsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Заявки',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 15),
            ),
            centerTitle: true,
            elevation: 0.5,
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: greyLight,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: TabBar(
                    indicator: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.25))
                        ],
                        color: greyMegaLight,
                        borderRadius: BorderRadius.circular(5.0)),
                    labelColor: Colors.black,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12),
                    // unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'активные'),
                      Tab(text: 'архив'),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    const NoBids(),
                    ReservationActive(),
                    // const NoComplietedBids(),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}

class NoBids extends StatelessWidget {
  const NoBids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/no_bids.png'),
          Text(
            'У вас пока нет заявок',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 24, color: mainColor),
            textAlign: TextAlign.center,
          ),
          Text(
            'Найдите события или общежитие и оставьте заявку на бронирование',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 13, color: greyDark),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<CommonState>(context, listen: false).updateTab(0);
              },
              child: Text('Отправиться в путешествие'))
        ],
      ),
    ));
  }
}

class NoComplietedBids extends StatelessWidget {
  const NoComplietedBids({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Вы ещё не принимали участие в программе',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 13, color: greyDark),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ReservationActive extends StatelessWidget {
  const ReservationActive({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [ReservationEvents(), ReservationPlaces()],
    );
  }
}

class ReservationEvents extends StatelessWidget {
  const ReservationEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Бронирование событий',
              style: Theme.of(context).textTheme.titleLarge),
          ReservatedEventCard(),
        ],
      ),
    );
  }
}

class ReservatedEventCard extends StatelessWidget {
  const ReservatedEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ваша заявка',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14)),
          SizedBox(height: 16),
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
          SizedBox(height: 16),
          Container(
            height: 120,
            // margin: const EdgeInsets.all(15.0),
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: greyDark)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('6',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                )),
                        Text('июня',
                            style: Theme.of(context).textTheme.titleSmall),
                        Spacer(),
                        Text('11:40',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 9)),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: greyLight,
                  height: 120,
                  width: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Экскурсия в Институт искусственного интеллекта',
                            style: Theme.of(context).textTheme.titleSmall),
                        Text(
                            'ФГАОУ ВО Самарский национальный исследовательский университет имени академика С.П. Королева',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReservationPlaces extends StatelessWidget {
  const ReservationPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Бронирование проживания',
              style: Theme.of(context).textTheme.titleLarge),
          ReservatedPlaceCard(),
        ],
      ),
    );
  }
}

class ReservatedPlaceCard extends StatelessWidget {
  const ReservatedPlaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ваша заявка',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14)),
          SizedBox(height: 16),
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
            child: Text('Находится на рассмотрении',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14)),
          ),
          SizedBox(height: 16),
          Container(
            height: 120,
            // margin: const EdgeInsets.all(15.0),
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: greyDark)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('6',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                )),
                        Text('июня',
                            style: Theme.of(context).textTheme.titleSmall),
                        Spacer(),
                        Text('11:40',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 9)),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: greyLight,
                  height: 120,
                  width: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Экскурсия в Институт искусственного интеллекта',
                            style: Theme.of(context).textTheme.titleSmall),
                        Text(
                            'ФГАОУ ВО Самарский национальный исследовательский университет имени академика С.П. Королева',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
