import 'package:flutter/material.dart';

class ListInforDetails extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final void Function() onTap;
  const ListInforDetails({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
  });

  @override
  State<ListInforDetails> createState() => _ListInforDetailsState();
}

class _ListInforDetailsState extends State<ListInforDetails> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      titleTextStyle: Theme.of(context).textTheme.displaySmall,
      subtitle: Text(widget.subTitle),
      subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      trailing: InkWell(
        onTap: widget.onTap,
        child: const Icon(Icons.edit),
      ),
      leading: Icon(
        widget.icon,
        size: 30,
      ),
    );
  }
}
