import '/index.dart';

class HandlingRequstView extends StatelessWidget {
  const HandlingRequstView({
    super.key,
    required this.requestStatus,
    required this.widget,
  });
  final RequestStatus requestStatus;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return requestStatus == RequestStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : requestStatus == RequestStatus.offLineFailure
            ? const TextWidget('offline error')
            : requestStatus == RequestStatus.serverFailure
                ? const TextWidget('srver error')
                : requestStatus == RequestStatus.noData
                    ? const TextWidget('noData')
                    : widget;
    /* switch (requestStatus) {
      case RequestStatus.loading:
        return const TextWidget('Loading');
      case RequestStatus.offLineFailure:
        return const TextWidget('offline error');
      case RequestStatus.serverFailure:
        return const TextWidget('srver error');
      case RequestStatus.noData:
        return const TextWidget('noData');
      default:
        return widget;
    } */
  }
}
