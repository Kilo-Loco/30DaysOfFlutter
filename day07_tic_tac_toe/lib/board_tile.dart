import 'package:day07_tic_tac_toe/tile_state.dart';
import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  final TileState tileState;
  final double dimension;
  final VoidCallback onPressed;

  BoardTile({Key key, this.tileState, this.dimension, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: dimension,
        height: dimension,
        child: FlatButton(
          onPressed: onPressed,
          child: _widgetForTileState(),
        ));
  }

  Widget _widgetForTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.EMPTY:
        {
          widget = Container();
        }
        break;

      case TileState.CROSS:
        {
          widget = Image.asset('images/x.png');
        }
        break;

      case TileState.CIRCLE:
        {
          widget = Image.asset('images/o.png');
        }
        break;
    }

    return widget;
  }
}
