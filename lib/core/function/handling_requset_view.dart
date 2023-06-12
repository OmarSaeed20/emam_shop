import '../../presentation/view/widgets/handling_view_widgets/loading_state_widget.dart';
import '../../presentation/view/widgets/handling_view_widgets/no_data_state_widget.dart';
import '../../presentation/view/widgets/handling_view_widgets/offline_internet_state_widget.dart';
import '../../presentation/view/widgets/handling_view_widgets/server_exception_state_widegt.dart';
import '../../presentation/view/widgets/handling_view_widgets/server_failure_state_widget.dart';
import '/index.dart';

class HandlingRequstView extends StatelessWidget {
  const HandlingRequstView(
    this.requeStat, {
    super.key,
    required this.widget,
    this.loading,
  });
  final RequestStatus requeStat;
  final Widget widget;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    switch (requeStat) {
      case RequestStatus.loading:
        return loading ?? const Center(child: LoadingStateWidget());
      case RequestStatus.offLineFailure:
        return const Center(child: OfflineInterNetWidget());
      case RequestStatus.serverFailure:
        return const Center(child: ServerFailurenWidget());
      case RequestStatus.noData:
        return const Center(child: NoDataStateWidget());
      case RequestStatus.serverException:
        return const Center(child: ServerExceptionWidget());
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

class HandlingRequstServerAuth extends StatelessWidget {
  const HandlingRequstServerAuth(
    this.requeStat, {
    super.key,
    required this.widget,
  });
  final RequestStatus requeStat;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    switch (requeStat) {
      case RequestStatus.loading:
        return const Center(child: LoadingStateWidget());
      case RequestStatus.offLineFailure:
        return widget;
      /*case RequestStatus.serverFailure:
        return const Center(child: TextWidget('srver error')); */
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
