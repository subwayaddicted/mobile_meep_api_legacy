import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile_meep/widgets/input.dart';

class InputPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final Map descriptionsText = {
    'cell': ['x of the cell', 'y of the cell', 'z of the cell'],
    'geometry': {
      'coordinates': [
        'x of the geometry',
        'y of the geometry',
        'z of the geometry'
      ],
      'center': [
        'x of the geometry center',
        'y of the geometry center',
      ],
      'material': ['epsilon'],
    },
    "sources": {
      "frequency": ['sources_frequency'],
      "center": ['sources_x', 'sources_y']
    },
    "simulation_time": {
      "between": ['simulation_time_between'],
      "until": ['simulation_time_until']
    },
    "pml_layers": ['pml_layers'],
    "resolution": ['resolution'],
  };
  final Map attributes = {
    'cell': ['cell_x', 'cell_y', 'cell_z'],
    'geometry': {
      'coordinates': [
        'geometry_coordinates_x',
        'geometry_coordinates_y',
        'geometry_coordinates_z',
      ],
      'center': [
        'geometry_center_x',
        'geometry_center_y',
      ],
      'material': ['geometry_material']
    },
    "sources": {
      "frequency": ['sources_frequency'],
      "center": ['sources_x', 'sources_y']
    },
    "simulation_time": {
      "between": ['simulation_time_between'],
      "until": ['simulation_time_until']
    },
    "pml_layers": ['pml_layers'],
    "resolution": ['resolution'],
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: InputField(this._fbKey, this.descriptionsText, this.attributes),
      ),
    );
  }
}
