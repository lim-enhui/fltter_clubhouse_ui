import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/screens/room_screen.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';

import '../data.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).push(
      //   MaterialPageRoute(
      //     fullscreenDialog: true,
      //     builder: (_) => RoomScreen(room: room),
      //   ),
      // ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          barrierColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          context: context,
          builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.84,
            child: Stack(
              children: [
                RoomScreen(room: room),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    height: 110.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '✌',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Leave quietly',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                              child: const Icon(CupertinoIcons.add, size: 30.0),
                            ),
                            const SizedBox(width: 16.0),
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                              child: const Icon(CupertinoIcons.hand_raised,
                                  size: 30.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        letterSpacing: 1.0,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100.0,
                      width: 85.0,
                      child: Stack(
                        children: [
                          UserProfileImage(
                            imageUrl: room.speakers[0].imageUrl,
                            size: 24.0,
                          ),
                          Positioned(
                            left: 28.0,
                            top: 20.0,
                            child: UserProfileImage(
                              imageUrl: room.speakers[1].imageUrl,
                              size: 24.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map(
                            (e) => Text(
                              '${e.givenName} ${e.familyName} 💬',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          '${room.speakers.length + room.followedBySpeakers.length + room.others.length} '),
                                  const WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.person_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(text: ' / ${room.speakers.length} '),
                                  const WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.chat_bubble_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
