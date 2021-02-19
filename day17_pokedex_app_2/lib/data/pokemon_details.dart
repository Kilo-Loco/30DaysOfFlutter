import 'package:flutter/material.dart';

class PokemonDetails {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;
  final String description;

  PokemonDetails(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.types,
      @required this.height,
      @required this.weight,
      @required this.description});
}
