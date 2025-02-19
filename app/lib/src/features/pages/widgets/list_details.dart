import 'package:flutter/material.dart';

class ListInforDetails extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String subTitle;
  final bool edit;
  final IconData icon;
  final void Function() onTap;
  const ListInforDetails({
    super.key,
    required this.controller,
    required this.title,
    required this.subTitle,
    required this.edit,
    required this.icon,
    required this.onTap,
  });

  @override
  State<ListInforDetails> createState() => _ListInforDetailsState();
}

class _ListInforDetailsState extends State<ListInforDetails> {
  bool edit = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      titleTextStyle: Theme.of(context).textTheme.displaySmall,
      subtitle: widget.edit ? TextField(
        controller: widget.controller,
      ) : Text(widget.subTitle),
      subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      trailing: widget.edit ? InkWell(
        onTap: widget.onTap,
        child: const Icon(Icons.check),
      ) : InkWell(
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
