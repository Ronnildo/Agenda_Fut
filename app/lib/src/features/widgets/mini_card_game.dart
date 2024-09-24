import 'package:app/src/features/widgets/container_fase.dart';
import 'package:flutter/material.dart';
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

  // void details(){
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsPage()));
  // }

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
            color: Theme.of(context).colorScheme.primary,
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
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.teamName.substring(0, 3),
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(
                      Icons.shield,
                      size: 40,
                    ),
                    Text(
                      "X",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Icon(
                      Icons.shield,
                      size: 40,
                    ),
                    Text(
                      widget.advTeamName.substring(0, 3),
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.date.day.toString(),
                            style: widget.date.day.toString().length < 2
                                ? Theme.of(context).textTheme.displayLarge
                                : const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                          ),
                          Text(
                            DateFormat("MMMM", "pt_BR")
                                .format(widget.date)
                                .substring(0, 2)
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        DateFormat("EEEE", "pt_BR").format(widget.date),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: widget.date.day.toString().length < 2
                            ? const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis,
                              )
                            : const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis,
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const ContainerFase(
                            fase: "Fasa de Grupos",
                            heigth: 15,
                            width: 80,
                          ),
                          const Icon(
                            Icons.alarm,
                            size: 10,
                          ),
                          Text(
                            widget.date.hour < 12
                                ? DateFormat.jm().format(widget.date)
                                : DateFormat.jm().format(widget.date),
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
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
