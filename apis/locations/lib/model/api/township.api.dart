import 'package:locations/model/api/base.api.dart';
import 'package:locations/model/dto/township.dto.dart';

class TownshipApi extends BaseApi {
  TownshipApi() : super("township");

  Future<List<Township>> findByStateId(int stateId) {
    return get(params: {"stateId": "$stateId"})
        .then((resp) => townshipFromJson(resp.body));
  }
}
