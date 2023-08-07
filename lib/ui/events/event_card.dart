import 'package:flutter/material.dart';

import '../../models/event/event.dart';
import '../../theme/theme.dart';
import '../utils.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final bool dataCompact;
  const EventCard({required this.event, this.dataCompact = true, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(getEventType(event.details!.type),
            style: const TextStyle(
                color: mainColor, fontWeight: FontWeight.w600, fontSize: 12)),
        Text(event.details!.name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(event.nameVuz,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 11)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              const Expanded(
                child: Text('г. Самара, ул Московское шоссе д 34',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
              ),
              if (dataCompact)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: greyLight,
                  ),
                  child: Text(
                    '${dateFormat(event.details!.dates!.from)} - ${dateFormat(event.details!.dates!.to)}',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              children: [
                event.details!.photos.isEmpty
                    ? const EventImageDefault()
                    : Image.network(
                        event.details!.photos[0],
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.height * 3 / 4,
                        fit: BoxFit.cover,
                      ),
                Positioned(
                    right: 0,
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          color: greyDark.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        getPrice(event.details!.price),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ))
              ],
            ),
          ),
        ),
        if (!dataCompact)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: greyLight,
            ),
            child: Text(
              '${dateFormat(event.details!.dates!.from)} - ${dateFormat(event.details!.dates!.to)}',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }
}

class EventImageDefault extends StatelessWidget {
  const EventImageDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/vr.png",
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.height * 3 / 4,
      fit: BoxFit.cover,
    );
  }
}
