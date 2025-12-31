
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/features/product/product_add/presentation/pages/product_add_view.dart';
import 'package:flutter_clean_architecture/features/product/product_listing/presentation/pages/product_listing_view.dart';
import 'package:go_router/go_router.dart';

import '../../auth/presentation/pages/login_page.dart';
import '../components/connectivity_overlay.dart';
import '../observers/navigator_observer.dart';
import '../services/session_service.dart';
import '../utils/utils.dart';
import 'app_routes.dart';
// import 'package:zconnect_revamp_flutter/src/features/core/production_order/presentation/pages/production_order_stock_management_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/${AppRoutes.productAdd}',
  navigatorKey: SessionManager.navigatorKey,
  observers: [ChuckerFlutter.navigatorObserver, UnFocusOnNavigateObserver()],
  routes: [
    /// ====================== Auth Routes ======================
    ...authRoutes,
    ...productRoutes,

    /// ====================== Core Routes ======================
    ShellRoute(
      builder: (context, GoRouterState state, child) {
        if (Utils.isAuthRoute(state.matchedLocation)) {
          return child;
        }
        // return child;
        return ConnectivityOverlay(child: child);
      },
      routes: [
        GoRoute(
      path: '/dummy',
      builder: (context, state) => SizedBox.shrink(),
    ),
        // _dashboard(),
        // ...itrRoutes,
        // ...productionOrderRoutes,
        // ...purchaseOrderRoutes,
        // ...deliveryOrderRoutes,
        // ...salesOrderRoutes,
        // _notifcations(),
      ],
    ),
  ],
);

List<GoRoute> authRoutes = [
 
  _login(),
 
];


List<GoRoute> productRoutes = [
 
  _productListing(),
  _productAdd(),
 
];


GoRoute _login() {
  return GoRoute(
    path: '/login',
    name: AppRoutes.login,
    builder: (context, state) => LoginPage(),
  );
}

GoRoute _productListing() {
  return GoRoute(
    path: '/product_listing',
    name: AppRoutes.productListing,
    builder: (context, state) => ProductListingPage(),
  );
}
GoRoute _productAdd() {
  return GoRoute(
    path: '/product_add',
    name: AppRoutes.productAdd,
    builder: (context, state) => ProductAddPage(),
  );
}
// List<GoRoute> itrRoutes = [
//   _itr(),
//   _createTr(),
//   _itrListing(),
//   _trListing(),
//   _settings(),
//   _itListing(),
//   _itrItemsLisitng(),
//   _trItemsListing(),
//   _giItemsListing(),
//   _createIt(),
//   _completedItItems(),
//   _physicalStockExchange(),
// ];

// List<GoRoute> salesOrderRoutes = [
//   _salesOrderListingRoute(),
//   _createSalesOrder(),
//   _salesOrderDraftedListing(),
//   _salesOrderCompletedItems(),
// ];

// List<GoRoute> productionOrderRoutes = [
//   _productionOrderListing(),
//   _productionOrderITR(),
//   _issueFromProduction(),
//   _receiptFromProduction(),
//   //_productionOrderStockManagement(),
//   _productionOrderItrDetails(),
//   _productionOrderTrDetails(),
//   _productionOrderItrGroupedByItem(),
//   _productionOrderItrGroupedByPo(),
//   _productionOrderTrGroupedByItem(),
//   _productionOrderTrGroupedByPo(),
//   _completedProductionOrderGroupedByItemCode(),
//   _completedProductionOrderGroupedByPoCode(),
//   _completedProductionOrderGroupedByItemCodeInTr(),
//   _completedProductionOrderGroupedByPoCodeInTr(),
//   _createGoodIssue(),
// ];

// List<GoRoute> purchaseOrderRoutes = [
//   _purchaseOrderListing(),
//   _createNewGrn(),
//   _pendingGRNs(),
//   _pendingGrnItemListing(),
//   _purchaseOrderLines(),
// ];

// GoRoute _createNewGrn() {
//   return GoRoute(
//     path: '/create_new_grn',
//     name: AppRoutes.createNewGRN,
//     builder: (context, state) {
//       PurchaseOrderParams? params = state.extra as PurchaseOrderParams?;
//       return CreateNewGrnPage(purchaseOrderParams: params);
//     },
//   );
// }

// GoRoute _pendingGRNs() {
//   return GoRoute(
//     path: '/pending_grns',
//     name: AppRoutes.pendingGRNs,
//     builder: (context, state) {
//       return PendingGRNListingPage();
//     },
//   );
// }

// GoRoute _productionOrderItrDetails() {
//   return GoRoute(
//     path: '/production_order_itr_detail',
//     name: AppRoutes.productionOrderItrDetail,
//     builder: (context, state) {
//       ITRParams itrModel = state.extra as ITRParams;
//       return ProductionOrderItrDetailsPage(params: itrModel);
//     },
//   );
// }

// GoRoute _productionOrderTrDetails() {
//   return GoRoute(
//     path: '/production_order_tr_detail',
//     name: AppRoutes.productionOrderTrDetail,
//     builder: (context, state) {
//       ITRParams itrModel = state.extra as ITRParams;
//       return ProductionOrderTRDetailsPage(params: itrModel);
//     },
//   );
// }

