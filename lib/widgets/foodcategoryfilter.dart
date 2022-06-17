import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transactionsprovider.dart';
import 'filter.dart';

class FoodCategoryFilter extends StatefulWidget {
  Function callBack;
  List<String>? initialData;
  FoodCategoryFilter({Key? key, required this.callBack, this.initialData})
      : super(key: key);

  @override
  State<FoodCategoryFilter> createState() => _FoodCategoryFilterState();
}

class _FoodCategoryFilterState extends State<FoodCategoryFilter> {
  @override
  Widget build(BuildContext context) {
    List<String>? categorySelected = widget.initialData;

    return Row(
      children: [
        Expanded(child: Text("Choose Category")),
        GestureDetector(
          onTap: () => {
            showModalBottomSheet<void>(
                barrierColor: Color.fromARGB(66, 0, 0, 0),
                context: context,
                builder: (BuildContext builder) {
                  return Container(
                    height: 200,
                    child: FilterRow(
                      callBack: (data) {
                        setState(() {
                          categorySelected = data;
                        });

                        widget.callBack(data);
                      },
                      filterEntry: <TextFilterEntry>[
                        TextFilterEntry("Food"),
                        TextFilterEntry("Subscription"),
                      ],
                      selectedData: categorySelected,
                      allowMultipleSelected: true,
                    ),
                  );
                })
          },
          child: Container(
              child: Row(
            children: [
              Text("${categorySelected?.length ?? "0"} selected"),
              Icon(Icons.arrow_right)
            ],
          )),
        )
      ],
    );
  }
}
