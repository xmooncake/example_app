import 'package:example_app/home/bloc/vehicles_bloc.dart';
import 'package:example_app/home/components/bottom_loader.dart';
import 'package:example_app/home/components/vehicles_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiclesList extends StatefulWidget {
  const VehiclesList({super.key});

  @override
  State<VehiclesList> createState() => _VehiclesListState();
}

class _VehiclesListState extends State<VehiclesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesBloc, VehiclesState>(
      bloc: context.read<VehiclesBloc>(),
      builder: (context, state) {
        switch (state.status) {
          case VehiclesStatus.initial:
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          case VehiclesStatus.error:
            return const Center(child: Text('Failed to fetch vehicles'));
          case VehiclesStatus.success:
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.vehicles.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.vehicles.length
                    ? const BottomLoader()
                    : VehiclesListItem(vehicle: state.vehicles[index]);
              },
            );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<VehiclesBloc>().add(VehiclesFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
