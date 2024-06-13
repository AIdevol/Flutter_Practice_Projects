import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PopoverPage extends StatefulWidget {
  const PopoverPage({Key? key}) : super(key: key);

  @override
  State<PopoverPage> createState() => _PopoverPageState();
}

class _PopoverPageState extends State<PopoverPage> {
  final popoverController = ShadPopoverController();

  final List<Map<String, String>> layer = [
    {'name': 'Width', 'initialValue': '100%'},
    {'name': 'Max. width', 'initialValue': '300px'},
    {'name': 'Height', 'initialValue': '25px'},
    {'name': 'Max. height', 'initialValue': 'none'},
  ];

  @override
  void dispose() {
    popoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: ShadPopover(
          controller: popoverController,
          popover: (context) => SizedBox(
            width: 288,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Dimensions',
                  style: textTheme
                      .headlineMedium, // Using appropriate text style here
                ),
                Text(
                  'Set the dimensions for the layer.',
                  style:
                      textTheme.bodyMedium, // Using appropriate text style here
                ),
                const SizedBox(height: 4),
                ...layer
                    .map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                e['name']!,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ShadInput(
                                initialValue: e['initialValue']!,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ],
            ),
          ),
          child: ShadButton.outline(
            text: const Text('Open popover'),
            onPressed: popoverController.toggle,
          ),
        ),
      ),
    );
  }
}
