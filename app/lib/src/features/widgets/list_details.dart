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
      titleTextStyle: TextStyle(
        fontSize: 12,
        color: Colors.grey.withOpacity(0.8),
        fontWeight: FontWeight.w600,
      ),
      subtitle: Text(widget.subTitle),
      subtitleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
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
