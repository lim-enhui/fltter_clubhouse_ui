import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/widgets.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${room.club} 🏠'.toUpperCase(),
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                letterSpacing: 1.0,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Icon(CupertinoIcons.ellipsis),
                      ],
                    ),
                    Text(
                      room.name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            children: room.speakers
                .map((e) => RoomUserProfile(
                      imageUrl: e.imageUrl,
                      size: 36.0,
                      name: e.givenName,
                      isNew: Random().nextBool(),
                      isMuted: Random().nextBool(),
                    ))
                .toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Followed by speakers',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.7,
            children: room.followedBySpeakers
                .map((e) => RoomUserProfile(
                      imageUrl: e.imageUrl,
                      size: 36.0,
                      name: e.givenName,
                      isNew: Random().nextBool(),
                    ))
                .toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Others in room',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.7,
            children: room.others
                .map((e) => RoomUserProfile(
                      imageUrl: e.imageUrl,
                      size: 36.0,
                      name: e.givenName,
                      isNew: Random().nextBool(),
                    ))
                .toList(),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 100.0)),
      ],
    );
  }
}
