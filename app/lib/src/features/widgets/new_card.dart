import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewCard extends StatefulWidget {
  final String title;
  final String home;
  final String? urlImageHome;
  final String alway;
  final String? urlImageAlway;
  final String fase;
  final DateTime date;
  final String locale;
  const NewCard({
    super.key,
    required this.title,
    required this.home,
    required this.alway,
    required this.fase,
    required this.date,
    required this.locale,
    this.urlImageAlway,
    this.urlImageHome,
  });

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 190,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black54,
              spreadRadius: 0,
              offset: Offset(0, 4),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width - 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.home.substring(0, 4),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Play",
                  ),
                ),
                const Icon(
                  Icons.shield,
                  size: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Text(
                    "X",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(
                  Icons.shield,
                  size: 40,
                ),
                Text(
                  widget.alway.substring(0, 4),
                  softWrap: true,
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Play",
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFF4E9F1D),
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.fase,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            // endIndent: 1,
            // indent: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_month,
                size: 20,
                color: Colors.black,
              ),
              SizedBox(
                width: widget.date.day < 10 ? 5 : 2,
              ),
              Text(
                "${widget.date.day} ${DateFormat("MMMM", "pt_BR").format(widget.date).substring(0, 3)} | ${DateFormat("EEEE", "pt_BR").format(widget.date)}"
                    .toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                width: widget.date.day < 10 ? 20 : 10,
              ),
              Text(
                widget.date.hour < 12
                    ? DateFormat.jm().format(widget.date)
                    : DateFormat.jm().format(widget.date),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Icon(
                Icons.alarm,
                size: 20,
                color: Colors.black,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.locale,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
