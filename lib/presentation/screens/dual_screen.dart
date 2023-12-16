import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String selectedFirstValue = '';
  String selectedSecondValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dual Picker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DualPicker(
              //list generate
              firstList: List.generate(200, (index) => (index + 1).toString()),
              secondList: ['Kg', 'Cm', ],
              onSelectionChanged: (firstValue, secondValue) {
                setState(() {
                  selectedFirstValue = firstValue;
                  selectedSecondValue = secondValue;
                });
              },
            ),
          
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Selected Values: $selectedFirstValue, $selectedSecondValue',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

class DualPicker extends StatefulWidget {
  final List<String> firstList;
  final List<String> secondList;
  final Function(String, String) onSelectionChanged;

  const DualPicker({
    Key? key,
    required this.firstList,
    required this.secondList,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _DualPickerState createState() => _DualPickerState();
}
class _DualPickerState extends State<DualPicker> {
  int selectedFirstIndex = 0;
  int selectedSecondIndex = 0;
  final int maxIndex = 3000;

  @override
  void initState() {
    super.initState();
    selectedFirstIndex = 0;
    selectedSecondIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Column(
          children: [
            Row(
              children: [
                Image.asset('assets/vector.png'),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedFirstIndex = _clampIndex(index);
                        widget.onSelectionChanged(
                          widget.firstList[selectedFirstIndex],
                          widget.secondList[selectedSecondIndex],
                        );
                      });
                    },
                    children: _buildPickerItems(widget.firstList),
                    scrollController: FixedExtentScrollController(
                        initialItem: selectedFirstIndex),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedSecondIndex = _clampIndex(index);
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
            ),
          ],
        )
      ],
    );
  }

  int _clampIndex(int index) {
    // Ensure the index stays within the specified range (0 to maxIndex)
    return index.clamp(0, maxIndex);
  }

  List<Widget> _buildPickerItems(List<String> items) {
    return items.map((String item) {
      return Center(
        child: Text(item),
      );
    }).toList();
  }
}
