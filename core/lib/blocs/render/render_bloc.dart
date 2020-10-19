import 'package:bloc/bloc.dart';
import 'package:core/blocs/render/render_event.dart';
import 'package:core/blocs/render/render_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class RenderBloc extends Bloc<RenderEvent, RenderState> {
  RenderBloc() : super(InitialRenderState());

  @override
  Stream<RenderState> mapEventToState(RenderEvent event) async* {
    yield RenderState();
  }

}