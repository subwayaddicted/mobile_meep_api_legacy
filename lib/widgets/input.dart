import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputField extends StatefulWidget {
  final GlobalKey<FormBuilderState> _fbKey;
  final Map descriptionsText;
  final Map attributes;

  // Constructor
  InputField(this._fbKey, this.descriptionsText, this.attributes);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextStyle mainCategoryTextStyle =
      TextStyle(fontSize: 25, color: Colors.white);

  TextStyle subcategoryTextStyle = TextStyle(fontSize: 17);

  List<Widget> buildFormsList(
      List attributes, List descriptionsText, TextInputType textInputType) {
    List<Container> forms = [];
    for (MapEntry attribute in attributes.asMap().entries) {
      forms.add(Container(
        padding: EdgeInsets.all(15),
        child: FormBuilderTextField(
          attribute: attribute.value,
          decoration:
              InputDecoration(labelText: descriptionsText[attribute.key]),
          validators: [FormBuilderValidators.numeric()],
          keyboardType: textInputType,
        ),
      ));
    }

    return forms;
  }

  Widget buildSliverListForms(List attributes, List descriptionsText,
      {TextInputType textInputType = TextInputType.number}) {
    return SliverList(
        delegate: SliverChildListDelegate(
            buildFormsList(attributes, descriptionsText, textInputType)));
  }

  Widget buildForms(List attributes, List descriptionsText,
      {TextInputType textInputType = TextInputType.number}) {
    return Column(
        children: buildFormsList(attributes, descriptionsText, textInputType));
  }

  Container buildMainCategoryHeader(String text) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: mainCategoryTextStyle,
      ),
    );
  }

  Container buildSubCategoryText(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: subcategoryTextStyle,
      ),
    );
  }

  Widget buildSubCategorySliverText(String text) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: subcategoryTextStyle,
        ),
      ),
    );
  }

  Container buildButtons(GlobalKey<FormBuilderState> _fbKey, color) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              if (_fbKey.currentState.saveAndValidate()) {
                print(_fbKey.currentState.value);
              }
            },
            color: color,
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            child: Text("Reset"),
            onPressed: () {
              _fbKey.currentState.reset();
            },
          ),
        ],
      ),
    );
  }

  Widget buildMainCategorySliverHeader(String text) {
    return SliverAppBar(
      title: Text(
        text,
        style: mainCategoryTextStyle,
      ),
      pinned: true,
    );
  }

  List<Widget> sliverList() {
    return <Widget>[
      buildMainCategorySliverHeader('Cell data:'),
      buildSliverListForms(
          this.widget.attributes['cell'], this.widget.descriptionsText['cell']),
      buildMainCategorySliverHeader('Geometry data:'),
      // Geometry: Coordinates
      buildSubCategorySliverText('Coordinates of the waveguide:'),
      buildSliverListForms(this.widget.attributes['geometry']['coordinates'],
          this.widget.descriptionsText['geometry']['coordinates']),
      // Geometry: Center
      buildSubCategorySliverText('Center of the waveguide'),
      buildSliverListForms(this.widget.attributes['geometry']['center'],
          this.widget.descriptionsText['geometry']['center']),
      // Geometry: Material
      buildSubCategorySliverText('Material of the waveguide (epsilon number):'),
      buildSliverListForms(this.widget.attributes['geometry']['material'],
          this.widget.descriptionsText['geometry']['material']),
      buildMainCategorySliverHeader('Sources data:'),
      buildSubCategorySliverText('Source frequency:'),
      buildSliverListForms(widget.attributes['sources']['frequency'],
          widget.descriptionsText['sources']['frequency']),
      buildSubCategorySliverText('Source center:'),
      buildSliverListForms(this.widget.attributes['sources']['center'],
          widget.descriptionsText['sources']['center']),
      buildMainCategorySliverHeader('Simulation data:'),
      buildSubCategorySliverText('Between:'),
      buildSliverListForms(this.widget.attributes['simulation_time']['between'],
          this.widget.descriptionsText['simulation_time']['between']),
      buildSubCategorySliverText('Until:'),
      buildSliverListForms(this.widget.attributes['simulation_time']['until'],
          this.widget.descriptionsText['simulation_time']['until']),
      buildMainCategorySliverHeader('PML:'),
      buildSliverListForms(this.widget.attributes['pml_layers'],
          this.widget.descriptionsText['pml_layers']),
      buildMainCategorySliverHeader('Resolution scale:'),
      buildSliverListForms(this.widget.attributes['resolution'],
          this.widget.descriptionsText['resolution']),
      SliverToBoxAdapter(
        child: buildButtons(widget._fbKey, Colors.orange),
      )
    ];
  }

  List<Widget> sliverList2() {
    return <Widget>[
      SliverAppBar(
        title: Text('2nd variant'),
        pinned: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            // Cell
            buildMainCategoryHeader('Cell data:'),
            buildForms(this.widget.attributes['cell'],
                this.widget.descriptionsText['cell']),
            // Geometry
            buildMainCategoryHeader('Geometry data:'),
            // Geometry: Coordinates
            buildSubCategoryText('Coordinates of the waveguide:'),
            buildForms(this.widget.attributes['geometry']['coordinates'],
                this.widget.descriptionsText['geometry']['coordinates']),
            // Geometry: Center
            buildSubCategoryText('Center of the waveguide'),
            buildForms(this.widget.attributes['geometry']['center'],
                this.widget.descriptionsText['geometry']['center']),
            // Geometry: Material
            buildSubCategoryText('Material of the waveguide (epsilon number):'),
            buildForms(this.widget.attributes['geometry']['material'],
                this.widget.descriptionsText['geometry']['material']),
            buildMainCategoryHeader('Sources data:'),
            buildSubCategoryText('Source frequency:'),
            buildForms(widget.attributes['sources']['frequency'],
                widget.descriptionsText['sources']['frequency']),
            buildSubCategoryText('Source center:'),
            buildForms(this.widget.attributes['sources']['center'],
                widget.descriptionsText['sources']['center']),
            buildMainCategoryHeader('Simulation data:'),
            buildSubCategoryText('Between:'),
            buildForms(this.widget.attributes['simulation_time']['between'],
                this.widget.descriptionsText['simulation_time']['between']),
            buildSubCategoryText('Until:'),
            buildForms(this.widget.attributes['simulation_time']['until'],
                this.widget.descriptionsText['simulation_time']['until']),
            buildMainCategoryHeader('PML:'),
            buildForms(this.widget.attributes['pml_layers'],
                this.widget.descriptionsText['pml_layers']),
            buildMainCategoryHeader('Resolution scale:'),
            buildForms(this.widget.attributes['resolution'],
                this.widget.descriptionsText['resolution']),
            // Buttons
            buildButtons(this.widget._fbKey, Colors.orange),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: widget._fbKey,
        child: CustomScrollView(
          slivers: sliverList(),
        ));
  }
}
