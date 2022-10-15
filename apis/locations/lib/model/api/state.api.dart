import 'package:locations/model/api/base.api.dart';
import 'package:locations/model/dto/state.dto.dart';

class StateApi extends BaseApi {
  StateApi() : super("state");

  Future<List<StateDto>> getAll() {
    return get().then((resp) => stateDtoFromJson(resp.body));
  }
}
