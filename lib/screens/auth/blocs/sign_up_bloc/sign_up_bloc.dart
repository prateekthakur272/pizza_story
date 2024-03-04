import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc(this._userRepository) : super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpLoading());
      try{
        final user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUserData(user);
        emit(SignUpSuccess());
      }catch(e){
        emit(SignUpFailure());
      }
    });
  }
}
