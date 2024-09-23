import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

/// Search modal.
class SearchModal extends StatelessWidget {
  /// Default constructor.
  const SearchModal({super.key});

  // TODO(marhaubrich): Remover;
  static final _mockedResult = List.generate(
    200000,
    (index) => index + 1,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: MediaQuery.of(context).size.width * .5,
        height: MediaQuery.of(context).size.height * .7,
        child: Column(
          children: [
            Hero(
              tag: 'search-bar',
              child: SearchBar(
                autoFocus: true,
                elevation: const WidgetStatePropertyAll(0),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    side: BorderSide(
                      color: Colors.grey.withOpacity(.5),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Material(
                color: Colors.transparent,
                child: SuperListView.builder(
                  padding: const EdgeInsets.all(8),
                  restorationId: 'search-list',
                  itemCount: _mockedResult.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item ${_mockedResult[index]}'),
                    leading: const Icon(HugeIcons.strokeRoundedComputer),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
