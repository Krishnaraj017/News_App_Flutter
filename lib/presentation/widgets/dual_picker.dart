import 'package:flutter/cupertino.dart';

class DualPicker extends StatefulWidget {
  final List<String> firstList;
  final List<String> secondList;
  final Function(String, String) onSelectionChanged;

  const DualPicker({super.key, 
    required this.firstList,
    required this.secondList,
    required this.onSelectionChanged,
  });

  @override
  _DualPickerState createState() => _DualPickerState();
}

class _DualPickerState extends State<DualPicker> {
  late int selectedFirstIndex;
  late int selectedSecondIndex;

  @override
  void initState() {
    super.initState();
    selectedFirstIndex = 0;
    selectedSecondIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedFirstIndex = index;
                widget.onSelectionChanged(
                  widget.firstList[selectedFirstIndex],
                  widget.secondList[selectedSecondIndex],
                );
              });
            },
            children: _buildPickerItems(widget.firstList),
          ),
        ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedSecondIndex = index;
                widget.onSelectionChanged(
                  widget.firstList[selectedFirstIndex],
                  widget.secondList[selectedSecondIndex],
                );
              });
            },
            children: _buildPickerItems(widget.secondList),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPickerItems(List<String> items) {
    return items.map((String item) {
      return Center(
        child: Text(item),
      );
    }).toList();
  }
}
