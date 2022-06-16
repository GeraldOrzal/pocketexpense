import 'package:flutter/material.dart';

class FilterRow extends StatefulWidget {
  List<TextFilterEntry> filterEntry;
  Function callBack;
  bool allowMultipleSelected;
  String? singleSelectedData;
  List<String>? selectedData;

  FilterRow(
      {Key? key,
      this.selectedData,
      this.singleSelectedData,
      required this.filterEntry,
      required this.allowMultipleSelected,
      required this.callBack})
      : super(key: key);

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class TextFilterEntry {
  const TextFilterEntry(this.text);
  final String text;
}

class _FilterRowState extends State<FilterRow> {
  String transactionFilter = "";

  List<String> filters = [];
  initState() {
    if (widget.allowMultipleSelected) {
      filters = widget.selectedData!;
    } else {
      transactionFilter = widget.singleSelectedData ?? "";
    }
  }

  Iterable<Widget> get category {
    return widget.filterEntry.map((TextFilterEntry transactionType) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(
            transactionType.text,
          ),
          selectedColor: Colors.yellow,
          selected: !widget.allowMultipleSelected
              ? transactionFilter == transactionType.text
              : filters.contains(transactionType.text),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                if (widget.allowMultipleSelected) {
                  if (!filters.contains(transactionType.text)) {
                    filters.add(transactionType.text);
                  } else {
                    filters.remove(transactionType.text);
                  }
                } else {
                  transactionFilter = transactionType.text;
                }
              }
            });
            widget.callBack(
                widget.allowMultipleSelected ? filters : transactionFilter);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: category.toList(),
    );
  }
}
