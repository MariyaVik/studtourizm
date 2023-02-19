import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../mobx/common/common_state.dart';
import '../../mobx/places/places_state.dart';
import '../../models/place/place.dart';
import '../navigation.dart';
import '../places/place_main_info.dart';

class MapWithMarkers extends StatefulWidget {
  const MapWithMarkers({Key? key}) : super(key: key);

  @override
  State<MapWithMarkers> createState() => _MapWithMarkersState();
}

class _MapWithMarkersState extends State<MapWithMarkers> {
  bool moreInfoVisible = false;
  Place currentPlace = const Place.none();
  List<Marker> _buildUserMarker() {
    Position? userPosition = Provider.of<CommonState>(context).position;
    print(userPosition);
    List<Marker> userMarker = [
      if (userPosition != null)
        Marker(
            point: LatLng(userPosition.latitude, userPosition.longitude),
            builder: (context) {
              return Image.asset('assets/icons/user_loc.png');
            }),
    ];
    return userMarker;
  }

  List<Marker> _buildMarkersOnMap() {
    List<Place> places = Provider.of<PlacesState>(context).places;

    List<Marker> markers = places.map(
      (e) {
        if (e.details.mainInfo.coordinates.latitude > 90 ||
            e.details.mainInfo.coordinates.longitude > 90) {
          return Marker(
              point: LatLng(55.7522, 37.6156),
              builder: (context) {
                return Image.asset('assets/icons/marker.png');
              });
        }
        return Marker(
            point: LatLng(e.details.mainInfo.coordinates.latitude,
                e.details.mainInfo.coordinates.longitude),
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  if (currentPlace == e) {
                    moreInfoVisible = !moreInfoVisible;
                  } else {
                    currentPlace = e;
                  }
                  print('нажали');

                  setState(() {});
                },
                child: Image.asset('assets/icons/marker.png'),
              );
            });
      },
    ).toList();
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      Position? userPosition = Provider.of<CommonState>(context).position;
      bool isLoad = Provider.of<PlacesState>(context).isLoading;
      return Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(userPosition?.latitude ?? 55.7522,
                  userPosition?.longitude ?? 37.6156),
              zoom: 7.2,
              onTap: (tapPosition, point) {
                moreInfoVisible = false;
                setState(() {});
              },
            ),
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: null,
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.hak',
              ),
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(
                  maxClusterRadius: 45,
                  size: const Size(40, 40),
                  anchor: AnchorPos.align(AnchorAlign.center),
                  fitBoundsOptions: const FitBoundsOptions(
                    padding: EdgeInsets.all(50),
                    maxZoom: 15,
                  ),
                  markers: isLoad ? <Marker>[] : _buildMarkersOnMap(),
                  builder: (context, markers) {
                    return Stack(
                      children: [
                        Image.asset('assets/icons/group_markers.png'),
                        Center(
                            child: Text(
                          markers.length.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                      ],
                    );
                  },
                ),
              ),
              MarkerLayer(
                markers: _buildUserMarker(),
              )
            ],
          ),
          if (moreInfoVisible)
            Positioned(
              top: 10,
              left: 16,
              child: MoreInfo(place: currentPlace),
            ),
        ],
      );
    });
  }
}

class MoreInfo extends StatelessWidget {
  const MoreInfo({required this.place, super.key});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppNavRouteName.placeDetails, arguments: place);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: 325,
        height: 116,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: place.details.mainInfo.photos.isEmpty
                    ? Image.asset('assets/house.png')
                    : Image.network(
                        place.details.mainInfo.photos[0],
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: PlaceMainInfo(
                  place: place, nameSize: 10, univSize: 9, addressSize: 8),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text('Общ'),
            //     Text('Общ'),
            //     Text('Общ'),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
