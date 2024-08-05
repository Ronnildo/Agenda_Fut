import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCardGame extends StatefulWidget {
  final Color colorBar;
  final String competitionName;
  final String teamName;
  final String advTeamName;
  final String localeName;
  final DateTime date;
  final String? urlImage;
  final void Function() onTap;
  const CustomCardGame({
    super.key,
    required this.colorBar,
    required this.competitionName,
    required this.teamName,
    required this.advTeamName,
    required this.localeName,
    required this.date,
    required this.onTap,
    this.urlImage,
  });

  @override
  State<CustomCardGame> createState() => _CustomCardGameState();
}

class _CustomCardGameState extends State<CustomCardGame> {
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return InkWell(
      onTap: widget.onTap,
      child: Container(
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
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: widget.urlImage!.isEmpty
                            ? const Icon(
                                Icons.shield,
                                size: 50,
                                color: Colors.white,
                              )
                            : ClipOval(
                                child: Image(
                                  image: AssetImage(
                                    widget.urlImage!,
                                  ),
                                  fit: BoxFit.contain,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            // width: MediaQuery.of(context).size.width / 6,
                            child: Text(
                              widget.teamName,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          // const Text("x"),
                          // Container(
                          //   padding: EdgeInsets.zero,
                          //   width: MediaQuery.of(context).size.width / 6,
                          //   child: Text(
                          //     widget.advTeamName,
                          //     maxLines: 2,
                          //     softWrap: true,
                          //     overflow: TextOverflow.ellipsis,
                          //     style: const TextStyle(
                          //       color: Colors.greenAccent,
                          //       fontWeight: FontWeight.w800,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          // ),
                        ],
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
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                  Text(
                    DateFormat("MMMM", "pt_BR").format(widget.date),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 26,
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
      ),
    );
  }
}
