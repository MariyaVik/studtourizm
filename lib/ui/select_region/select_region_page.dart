import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/mobx/places/places_state.dart';

import '../../mobx/common/common_state.dart';
import '../../models/region/region.dart';
import '../../theme/theme.dart';
import '../app.dart';
import '../common/close_button.dart';
import '../navigation.dart';
import 'regions_list.dart';

class SelectRegionPage extends StatelessWidget {
  const SelectRegionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height / 4.5),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Provider.of<CommonState>(context,
                                    listen: false)
                                .getCurrentLocation();
                            var coord =
                                Provider.of<CommonState>(context, listen: false)
                                    .position;
                            // await Provider.of<PlacesState>(context,
                            //         listen: false)
                            //     .loadPlacesNearUser(
                            //         coord!.latitude, coord.longitude);
                            Navigator.of(context)
                                .pushReplacementNamed(AppNavRouteName.home);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: const [
                                ImageIcon(
                                  AssetImage('assets/icons/pos.png'),
                                  color: greyDark,
                                ),
                                SizedBox(width: 8),
                                Text('Выбрать мое местоположение')
                              ],
                            ),
                          ),
                        ),
                        CloseButtonMy(
                          routeName: AppNavRouteName.home,
                        ),
                      ],
                    ),
                    const Center(
                      child: Text(
                        'Выберите регион',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        cursorColor: mainColor,
                        decoration: InputDecoration(
                          hintText: 'Введите название',
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: greyDark),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RegionItem(
                  region:
                      Region(code: 77, name: 'Москва', codeISO: RegionAbb.msk),
                  textStyle: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RegionItem(
                  region: Region(
                      code: 78,
                      codeISO: RegionAbb.sbp,
                      name: 'Санкт-Петербург'),
                  textStyle: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Divider(),
              ...regionList
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: RegionItem(region: e),
                      ))
                  .toList()
            ]),
          ),
        ]),
        bottomSheet: Provider.of<CommonState>(context, listen: false)
                    .onlySelReg !=
                null
            ? Container(
                width: double.infinity,
                color: backColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        CommonState regProv =
                            Provider.of<CommonState>(context, listen: false);
                        if (regProv.onlySelReg != null) {
                          if (regProv.onlySelReg != regProv.currentRegion) {
                            regProv.currentRegion = regProv.onlySelReg!;
                            regProv.onlySelReg = null;
                          }
                          print(
                              'По итогу такой: ${regProv.currentRegion.name}');
                          mainNavigatorKey.currentState!
                              .pushReplacementNamed(AppNavRouteName.home);
                        } else {
                          print('ВЫ НЕ ВЫБРАЛИ РЕГИОН');
                        }
                      },
                      child: const Text('Выбрать')),
                ),
              )
            : null,
      );
    });
  }
}

class RegionItem extends StatefulWidget {
  const RegionItem(
      {required this.region, this.textStyle = const TextStyle(), super.key});
  final Region region;
  final TextStyle textStyle;

  @override
  State<RegionItem> createState() => _RegionItemState();
}

class _RegionItemState extends State<RegionItem> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    CommonState regProv = Provider.of<CommonState>(context);
    return Observer(builder: (context) {
      return ListTile(
        title: Row(
          children: [
            Text(widget.region.name, style: widget.textStyle),
            if (regProv.onlySelReg == widget.region)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ImageIcon(AssetImage('assets/icons/check.png')),
              ),
          ],
        ),
        selectedColor: mainColor,
        selected: regProv.onlySelReg == widget.region,
        onTap: () {
          print('Сейчас регион такой: ${regProv.currentRegion.name}');
          print('Выбрали этот: ${widget.region.name}');
          _selected = !_selected;
          if (_selected) {
            regProv.onlySelReg = widget.region;
          } else {
            regProv.onlySelReg = null;
          }
          print(
              'Tеперь выбранный такой: ${regProv.onlySelReg?.name ?? 'никакой'}');
          print('А текущий этот: ${regProv.currentRegion.name}');
          // setState(() {});
        },
        // groupValue: null,
        // onChanged: (Null? value) {},
        // value: null,
      );
    });
  }
}
