import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CustomCard extends StatefulWidget {
  final Color colorBar;
  final String competitionName;
  final String teamName;
  final String localeName;
  final DateTime date;
  final String? urlImage;
  const CustomCard({
    super.key,
    required this.colorBar,
    required this.competitionName,
    required this.teamName,
    required this.localeName,
    required this.date,
    this.urlImage,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xFF0077B6),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6,
            spreadRadius: 0.6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 26,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: widget.colorBar,
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.competitionName,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    wordSpacing: 0,
                    letterSpacing: 0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.shield,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        widget.teamName,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Local:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width / 2,
                  
                  child: Text(
                    widget.localeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.date.day.toString(),
                  style: const TextStyle(
                      fontSize: 55, fontWeight: FontWeight.bold, height: 0),
                ),
                Text(
                  DateFormat("MMMM", "pt_BR").format(widget.date),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 5,
                    height: 0,
                  ),
                ),
                Text(
                  DateFormat("EEEE", "pt_BR").format(widget.date),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.alarm,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.date.hour < 12
                          ? DateFormat.jm().format(widget.date)
                          : DateFormat.jm().format(widget.date),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
