import 'package:evently2/ui/model/user_dm.dart';
import 'package:flutter/material.dart';

import '../model/event_dm.dart';
import '../model/firebase_utilits/firebase_functions.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class EventWidget extends StatefulWidget {
  final EventDM eventDM;
  final VoidCallback? onFavoriteChanged;

  const EventWidget({super.key, required this.eventDM, this.onFavoriteChanged});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .24,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.eventDM.categoryDM.imagePath,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildDateContainer(), buildTitleContainer()],
          ),
        ],
      ),
    );
  }

  buildDateContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.offWhite,
        ),
        child: Text(
          "${widget.eventDM.dateTime.day} Jan",
          textAlign: TextAlign.start,
          style: AppTextStyles.blue14SemiBold,
        ),
      ),
    );
  }

  buildTitleContainer() => Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: AppColors.offWhite,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.eventDM.title,
            style: AppTextStyles.blue14SemiBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        InkWell(
          onTap: () async {
            if (UserDM.currentUser!.favoriteEvents.contains(widget.eventDM.id)) {
              await removeEventFromFavorite(widget.eventDM.id, UserDM.currentUser!);
            } else {
              await addEventToFavorite(widget.eventDM.id, UserDM.currentUser!);
            }
            setState(() {});
          },
          child: Icon(
            UserDM.currentUser!.favoriteEvents.contains(widget.eventDM.id)
                ? Icons.favorite
                : Icons.favorite_border,
            color: AppColors.blue,
          ),
        ),      ],
    ),
  );
}