import 'package:counter/pages/welcome/bloc/bloc_event.dart';
import 'package:counter/pages/welcome/bloc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBloc(): super(WelcomeState()){
    on<WelcomeEvent>((event,emit)=>{
      emit(WelcomeState(page:state.page))
    });
  }
  
}