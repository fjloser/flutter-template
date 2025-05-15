import 'package:flutter_getx_template/common/index.dart';

import '../../services/test_repository.dart';

class TestApi extends TestRepository {
  Future<dynamic> test() async {
    return httpRequest(
      future: () => dio.get('/xz-city/original-images/download-tasks/all',
          queryParameters: {"page": 1, "pageSize": 10}),
      coverEntity: TestModel.fromJson,
    );
  }
}
