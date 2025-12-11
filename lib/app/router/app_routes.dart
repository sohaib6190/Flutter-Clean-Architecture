class AppRoutes {
  AppRoutes._();
  //============================== Auth ==============================
  static const String splash = 'splash';
  static const String login = 'login';
  static const String signUp = 'signup';
  static const String forgotPassword = 'forgot_password';
  static const String resetPassword = 'reset_password';
  static const String changePassword = 'change_password';
  static const String verifyOtp = 'verify_otp';
  static const String productListing = 'product_listing';
  // ============================ Core ==============================
  static const String home = 'home';
  static const String settings = 'settings';
  static const String addNewBlog = 'add_new_blog';
  static const String blogViewer = 'blog_viewer';
  static const String dashboard = 'dashboard';
  static const String createInventoryTransferRequest = 'create_itr';
  static const String createTransferRequest = 'create_tr';
  static const String barCodeScanner = 'barcode';
  static const String notifications = 'notifications';
  static const String userListing = 'user_listing';
  static const String synchronization = 'synchronization';
  static const String transferReceipt = 'transfer_receipt';
  static const String goodsReceiptPoPage = 'goods_receipt_po';
  static const String grPoStandalone = 'gr_po_standalone';
  static const String itrListing = 'itr_open_document_view';
  static const String trListing = 'tr_open_document_view';
  static const String editProfile = 'edit_profile';
  static const String itrItemsListing = 'itr_items_listing';
  static const String trItemsListing = 'tr_items_listing';
  static const String giItemsListing = 'gi_items_listing';
  static const String itListing = 'it_listing';
  static const String inventoryTransferPage = 'create_it';
  static const String completedItItemsListing = 'completed_it_items_listing';
  static const String productionOrderListing = 'production_order_listing';
  static const String purchaseOrderListing = 'purchase_order_listing';
  static const String productionOrderITR = 'production_order_itr';
  static const String issueFromProduction = 'issue_from_production';
  static const String receiptFromProduction = 'receipt_from_production';
  static const String physicalStockCheck = 'physical_stock_check';
  static const String createSalesOrder = 'create_sales_order';
  static const String salesOrderDraftedListing = 'sales_order_drafted_listing';
  static const String salesOrderCompletedItems = 'sales_order_completed_items';
  static const String salesOrderListing = 'sales_order_listing';
  static const String createNewGRN = 'create_new_grn';
  static const String pendingGRNs = 'pending_grns';
  static const String pendingGrnListing = 'pending_grn_listing';
  static const String purchaseOrderLines = 'purchase_order_lines';
  static const String productionOrderItrDetail = 'production_order_itr_detail';
  static const String productionOrderTrDetail = 'production_order_tr_detail';
  static const String productionOrderItrGroupedByItem =
      'production_order_itr_grouped_by_item';
  static const String productionOrderItrGroupedByPo =
      'production_order_itr_grouped_by_po';
  static const String productionOrderTrGroupedByItemCode =
      'production_order_tr_grouped_by_item';
  static const String productionOrderTrGroupedByPo =
      'production_order_tr_grouped_by_po';
  static const String completedProductionOrderGroupedByPoNumberInIT =
      'completed_production_order_grouped_by_po_in_it';
  static const String completedProductionOrderGroupedByItemCodeInIT =
      'completed_production_order_grouped_by_item_code_in_it';
  static const String completedProductionOrderGroupedByPoNumberInTr =
      'completed_production_order_grouped_by_po_in_tr';
  static const String completedProductionOrderGroupedByItemCodeInTr =
      'completed_production_order_grouped_by_item_code_in_tr';
  static const String createGoodIssue = 'create_good_issue';
  static const String productionOrderStockManagement =
      'production_order_stock_management';
  static const String createDispatchOrder = 'create_dispatch_order';

  /// Delivery Routes
  static const String createDelivery = 'create_delivery';
  static const String deliveryOrderListing = 'delivery_order_listing';
  static const String deliveryOrderDraftedItems =
      'delivery_order_drafted_items';
  static const String deliveryOrderCompletedItems =
      'delivery_order_completed_items';
  static const String selectSalesOrderForDelivery =
      'select_sales_order_for_delivery';
}
