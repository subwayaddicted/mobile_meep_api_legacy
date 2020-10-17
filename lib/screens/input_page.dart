import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile_meep/widgets/input.dart';

class InputPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final List<String> descriptionsText = ['x of the cell', 'y of the cell'];
  final Map attributes = {
    'cell': ['x', 'y']
  };
  final Map validators = {
    'cell': {
      'x': [
        FormBuilderValidators.numeric(),
      ],
      'y': [
        FormBuilderValidators.numeric(),
      ],
    }
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Card(
          child: InputField(this._fbKey, this.descriptionsText, this.attributes,
              this.validators),
        ),
      ),
    );
  }
}
