import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Alternative [State] implementation that separates GUI from logic.
///
/// Creates a state that mainly wraps the widgets that compound the GUI, and
/// then gets a binded [Bloc] class that wraps the logic to be applyed
/// in this state.
abstract class AppController<TWidget extends StatefulWidget, TBind extends Bloc> extends State<TWidget>
    implements Disposable {
  final TBind _bloc = Modular.get<TBind>();

  /// The binded component that wraps this class logic.
  TBind get bloc => _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    _bloc.close();
    Modular.dispose<TBind>();
  }
}
