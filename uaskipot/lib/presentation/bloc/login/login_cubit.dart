import 'package:d_info/d_info.dart';
import 'package:d_session/d_session.dart';
import 'package:uaskipot/common/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uaskipot/data/source/user_source.dart';

import '../../../data/models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(null, RequestStatus.init));

  Future<void> clickLogin(String email, String password) async {
    User? result = await UserSource.login(email, password);
    if (result == null) {
      DInfo.toastError('Login Failed');
      emit(LoginState(null, RequestStatus.failed));
    } else {
      DInfo.toastSuccess('Login Success');
      DSession.setUser(result.toJson());
      emit(LoginState(result, RequestStatus.success));
    }
  }
}
