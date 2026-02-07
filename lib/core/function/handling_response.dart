import 'package:ecommerce/index.dart';

handlingRespose(response) {
  if (response is RequestStatus) {
    return response;
  } else {
    return RequestStatus.success;
  }
}
