import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class MiniCardGame extends StatefulWidget {
  final Color colorBar;
  final String teamName;
  final String advTeamName;
  final String localeName;
  final DateTime date;
  final String? urlImage;
  final void Function() onTap;
  const MiniCardGame({
    super.key,
    required this.colorBar,
    required this.teamName,
    required this.advTeamName,
    required this.localeName,
    required this.date,
    required this.onTap,
    this.urlImage,
  });

  @override
  State<MiniCardGame> createState() => _MiniCardGameState();
}

class _MiniCardGameState extends State<MiniCardGame> {
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10,
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
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
          child: Stack(
            children: [
              Container(
                width: 16,
                decoration: BoxDecoration(
                  color: widget.colorBar,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                widthFactor: 10,
                child: Container(
                  // width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(widget.teamName),
                          const Text(" x "),
                          Text(widget.advTeamName),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Local: "),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.localeName,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      right: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.topLeft,
                          children: [
                            Align(
                              alignment: Alignment.lerp(Alignment.center,
                                  Alignment.topLeft, 1)!,
                              child: Text(
                                widget.date.day.toString(),
                                style: widget.date.day.toString().length < 2
                                    ? Theme.of(context).textTheme.displayLarge
                                    : const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, ),
                              ),
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    DateFormat("MMMM", "pt_BR")
                                        .format(widget.date),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    DateFormat("EEEE", "pt_BR")
                                        .format(widget.date),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: widget.date.day.toString().length < 2 ? const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      overflow: TextOverflow.ellipsis,
                                    ) : const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.alarm,
                                        size: 16,
                                      ),
                                      Text(
                                        widget.date.hour < 12
                                            ? DateFormat.jm()
                                                .format(widget.date)
                                            : DateFormat.jm()
                                                .format(widget.date),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
