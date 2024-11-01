import 'package:app/src/features/pages/home/widgets/container_fase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewCard extends StatefulWidget {
  final String id;
  final String title;
  final String home;
  final String? urlImageHome;
  final String alway;
  final String? urlImageAlway;
  final String fase;
  final DateTime date;
  final String locale;
  final void Function() onTap;
  final void Function() delete;
  const NewCard({
    super.key,
    required this.id,
    required this.title,
    required this.home,
    required this.alway,
    required this.fase,
    required this.date,
    required this.locale,
    required this.onTap,
    required this.delete,
    this.urlImageAlway,
    this.urlImageHome,
  });

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onDoubleTap: widget.onTap,
      onTap: widget.onTap,
      onLongPress: widget.delete,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        height: 190,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.1),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black54,
                spreadRadius: 0,
                blurStyle: BlurStyle.normal,
                offset: Offset(1, 5),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Nome time casa
                  Text(
                    widget.home.split(" ")[0].length >= 3
                        ? widget.home.substring(0, 3).toUpperCase()
                        : widget.home.toUpperCase(),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    Icons.shield,
                    size: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
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
                    size: 50,
                  ),
                  // Nome time fora
                  Text(
                    widget.alway.split(" ")[0].length >= 3
                        ? widget.alway.substring(0, 3).toUpperCase()
                        : widget.alway.toUpperCase(),
                    softWrap: true,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            ContainerFase(
              fase: widget.fase,
              width: 120,
              heigth: 22,
            ),
            const Divider(
              color: Colors.grey,
            ),
            // Data e Horário
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 20,
                  color: Colors.black,
                ),
                Text(
                  "${widget.date.day} ${DateFormat("MMMM", "pt_BR").format(widget.date).substring(0, 3).toUpperCase()} | ${DateFormat("EEEE", "pt_BR").format(widget.date).toUpperCase()}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  width:
                      DateFormat("EEEE", "pt_BR").format(widget.date).length <=
                              7
                          ? 125
                          : 80,
                ),
                Text(
                  DateFormat("HH:mm").format(widget.date),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Icon(
                  Icons.alarm,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
            // Localização do Jogo
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
