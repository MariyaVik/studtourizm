import 'package:flutter/material.dart';
import 'package:studtourizm/ui/navigation.dart';

import '../../theme/theme.dart';
import '../common/close_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<OnBordItem> item = [
    OnBordItem(
        backImageName: 'assets/images/onBord1.png',
        title: 'Путешествуй по России',
        info:
            'Более 150 университетов\nБолее 100 городов\nБолее 70 регионов\nВсе федеральные округа'),
    OnBordItem(
        backImageName: 'assets/images/onBord2.png',
        subTitle: 'Программа для студентов и молодых специалистов'),
    OnBordItem(
        backImageName: 'assets/images/onBord3.png',
        title: 'Размещение от университетов',
        info:
            'Предоставление общежитий \nУникальные события\nПутешествия в одиночку или с друзьями'),
    OnBordItem(
        backImageName: 'assets/images/onBord4.png',
        title: 'События',
        subTitle: 'Культурные\nНаучные\nПрофориентационные'),
  ];
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return OnbordView(
                  backImageName: item[index].backImageName,
                  title: item[index].title,
                  subTitle: item[index].subTitle,
                  info: item[index].info,
                );
              },
              onPageChanged: (value) {
                activePage = value;
                setState(() {});
              },
            ),
            CloseButtonMy(
              routeName: AppNavRouteName.selectRegion,
              xColor: greyDark,
              backColor: Colors.white.withOpacity(0.6),
              padding: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                      item.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StoriesIndicator(
                              isActive: index == activePage,
                            ),
                          ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBordItem {
  final String backImageName;
  final String? title;
  final String? subTitle;
  final String? info;
  OnBordItem({
    required this.backImageName,
    this.title,
    this.subTitle,
    this.info,
  });
}

class OnbordView extends StatelessWidget {
  final String backImageName;
  final String? title;
  final String? subTitle;
  final String? info;
  const OnbordView(
      {required this.backImageName,
      this.title,
      this.subTitle,
      this.info,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          backImageName,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120, left: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(
                  title!,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              const SizedBox(height: 12),
              if (subTitle != null)
                Text(subTitle!,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.white)),
              const Spacer(),
              if (info != null)
                Text(info!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 24, color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}

class StoriesIndicator extends StatelessWidget {
  final bool isActive;
  const StoriesIndicator({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isActive ? greyLight : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.black.withOpacity(0.25),
                blurRadius: 5)
          ]),
      height: isActive ? 6 : 4,
      width: MediaQuery.of(context).size.width / 5,
    );
  }
}
