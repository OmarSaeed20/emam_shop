import '/index.dart';

class HandlingRequstView extends StatelessWidget {
  const HandlingRequstView(this.requeStat, {super.key, required this.widget});
  final RequestStatus requeStat;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    switch (requeStat) {
      case RequestStatus.loading:
        return const Center(child: TextWidget('Loading ...'));
      case RequestStatus.offLineFailure:
        return const Center(child: TextWidget('offline error'));
      case RequestStatus.serverFailure:
        return const Center(child: TextWidget('srver error'));
      case RequestStatus.noData:
        return const Center(child: TextWidget('noData'));
      case RequestStatus.serverException:
        return const Center(child: TextWidget('serverException'));
      default:
        return widget;
    }
    /* return requestStatus == RequestStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : requestStatus == RequestStatus.offLineFailure
            ? const TextWidget('offline error')
            : requestStatus == RequestStatus.serverFailure
                ? const TextWidget('srver error')
                : requestStatus == RequestStatus.noData
                    ? const TextWidget('noData')
                    : widget; */
  }
}

class HandlingRequstServerError extends StatelessWidget {
  const HandlingRequstServerError(this.requeStat,
      {super.key, required this.widget});
  final RequestStatus requeStat;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    switch (requeStat) {
      case RequestStatus.offLineFailure:
        return const Center(child: TextWidget('Chick your internet'));
      case RequestStatus.serverFailure:
        return const Center(child: TextWidget('srver error'));
      default:
        return widget;
    }
    /* return requestStatus == RequestStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : requestStatus == RequestStatus.offLineFailure
            ? const TextWidget('offline error')
            : requestStatus == RequestStatus.serverFailure
                ? const TextWidget('srver error')
                : requestStatus == RequestStatus.noData
                    ? const TextWidget('noData')
                    : widget; */
  }
}
