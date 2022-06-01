import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';

class CheckboxFormField extends StatefulWidget {
  CheckboxFormField({Key? key}) : super(key: key);

  @override
  State<CheckboxFormField> createState() => _CheckboxFormFieldState();
}

class _CheckboxFormFieldState extends State<CheckboxFormField> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state) {
        return Column(
          children: [
            Checkbox(
              value: checkboxValue,
              onChanged: (value) {
                checkboxValue = value!;
                state.didChange(value);
              },
            ),
            Text(
              state.errorText ?? '',
              style: const TextStyle(
                color: onError,
              ),
            ),
          ],
        );
      },
      validator: (value) {
        if (!checkboxValue) return 'You must check this box';
      },
    );
  }
}
