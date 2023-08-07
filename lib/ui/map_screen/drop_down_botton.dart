import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class SelectWidget extends StatefulWidget {
  final String hint;
  final List listItem;
  const SelectWidget({required this.hint, required this.listItem, super.key});

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
          widget.hint,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 13, color: const Color(0xFF6C6C6C)),
          overflow: TextOverflow.ellipsis,
        ),
        items: widget.listItem
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13, color: const Color(0xFF6C6C6C)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        icon: Image.asset('assets/icons/arrow_bottom.png'),
        iconSize: 14,
        iconEnabledColor: greyDark,
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: greyDark,
          ),
        ),
        buttonHeight: 40,
        buttonWidth: 140,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownElevation: 0,
        dropdownDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        offset: const Offset(0, 10),
      ),
    );
  }
}
