import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputField extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey;
  final List descriptionsText;
  final Map attributes;
  final Map validators;

  // Constructor
  InputField(
      this._fbKey, this.descriptionsText, this.attributes, this.validators);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: FormBuilder(
            key: this._fbKey,
            child: Column(
              children: [
                for (MapEntry attribute
                    in this.attributes['cell'].asMap().entries)
                  FormBuilderTextField(
                    attribute: attribute.value,
                    decoration: InputDecoration(
                        labelText: this.descriptionsText[attribute.key]),
                    validators: this.validators['cell'][attribute.value],
                  ),
              ],
            )));
  }
}
