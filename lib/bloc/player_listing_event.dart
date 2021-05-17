import 'package:flutter/material.dart';
import 'package:statbuzz/models/nation_model.dart';

abstract class PlayerListingEvent {}

class CountrySelectedEvent extends PlayerListingEvent {
  final NationModel nationModel;

  CountrySelectedEvent({@required this.nationModel})
      : assert(nationModel != null);
}
