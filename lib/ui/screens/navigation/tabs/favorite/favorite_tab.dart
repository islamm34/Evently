import 'package:flutter/material.dart';

import '../../../../model/event_dm.dart';
import '../../../../model/firebase_utilits/firebase_functions.dart';
import '../../../../model/user_dm.dart';
import '../../../../utils/app_styles.dart';
import '../../../../widgets/event_widget.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: getFavoriteEventsForUser(UserDM.currentUser!.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: Text(snapshot.error.toString())),
            );
          } else if (snapshot.hasData) {
            var events = snapshot.data!;
            return Column(
              children: [
                SizedBox(height: 8.0),
                buildEventsList(snapshot.data!),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  buildEventsList(List<EventDM> events) {
    if (events.isEmpty) {
      return Expanded(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "No favorite events added yet.",
              style: AppTextStyles.grey14Regular
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 16.0),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              bottom: 12.0,
            ),
            child: EventWidget(eventDM: events[index]),
          );
        },
      ),
    );
  }
}