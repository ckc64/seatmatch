import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'event_detailswith_group_widget.dart' show EventDetailswithGroupWidget;
import 'package:flutter/material.dart';

class EventDetailswithGroupModel
    extends FlutterFlowModel<EventDetailswithGroupWidget> {
  ///  Local state fields for this page.

  bool isInterested = true;

  bool isSetPriceRange = true;

  bool showNoOfInterested = true;

  bool showYoureOnTheList = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for priceRangeDropdown widget.
  String? priceRangeDropdownValue;
  FormFieldController<String>? priceRangeDropdownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
