import 'package:booking_appointment/table_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridTable extends StatefulWidget {
  const GridTable({super.key});

  @override
  State<GridTable> createState() => _GridTableState();
}

class _GridTableState extends State<GridTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 1000,
        child: StaggeredGrid.count(
            axisDirection: AxisDirection.right,
            crossAxisCount: 10,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: _itemBuilder(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: _itemBuilder(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: _itemBuilder(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 1,
                child: _itemBuilder(),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 1,
                child: _itemBuilder(),
              ),
            ]),
      ),
    );
  }

  Widget _itemBuilder() {
    return Container(
        width: cellWidth,
        height: cellHeight,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.yellow.shade500,
          border: Border.all(
            color: Colors.black12,
            width: 0.5,
          ),
        ),
        child: Text('data'));
  }
}
