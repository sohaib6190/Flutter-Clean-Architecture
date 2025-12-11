var _auth = "Auth/IAuthFeature";
var _warehouse = "ZCAPI/IWarehouseFeature";
var _inventoryTransferRequest = "ZCAPI/IInventoryTransferRequestFeature";
var _inventoryTransfer = "ZCAPI/IInventoryTransferFeature";
var _transferReceive = "ZCAPI/ITransferReceiveFeature";
var _dashboard = "ZCAPI/IDashboardFeature";
var _productionOrder = "ZCAPI/IProductionOrderFeature";
var _purchaseOrder = "ZCAPI/IPurchaseOrderFeature";
var _sap = "ZCAPI/ISapFeature";
var _issueForProduction = "ZCAPI/IIssueForProductionFeature";
var _goodIssue = "ZCAPI/IGoodIssueFeature";
var _salesOrder = "ZCAPI/ISalesOrderFeature";
var _businessPartner = "ZCAPI/IBusinessPartnerFeature";
var _receiptFromProduction = "ZCAPI/IReceiptFromProductionFeature";
var _vehicle = "ZCAPI/IVehicleFeature";
var _driver = "ZCAPI/IDriverFeature";
var _dispatch = "ZCAPI/IDispatchOrderFeature";
var _contractor = "ZCAPI/IContractorFeature";



enum ApiEndpoints {




  /// ================= Auth =======================
  signup,
  logout,
  changePassword,
  refreshToken,
  login,
productListing,
productAdd,
  /// ======================== Forget Password =========================
  forgetPassword,
  verifyOtpForForgetPassword,
  resetPassword,

  /// ==================== 2FA =====================
  get2FASecretKey,
  addOrUpdate2FA,
  remove2FA,
  verifyOtp,

  /// ======= Inventory Transfer Request ===========
  retrieveItemDetailsFromBarCode,
  listAllItemsByUserId,
  listAllBinsByWarehouseCode,
  getDefaultBinByWarehouseCodeAndItemCode,
  createITR,
  fetchAllItemsOfITR,
  deleteItemFromITR,
  getOpenItrDetailsByWarehouseAndItemCode,
  checkIFITRExists,
  listAllItr,
  listAllItrsInIT,
  listAllItrsByUser,
  warehousesListing,

  ///========================= Inventory Transfer =========================
  // listAllIts,
  listDraftedItemsByWarehouseInIT,
  postInventoryTransferToDraft,
  transferInventoryTransferItems,
  deleteInventoryTransferItemFromDraft,
  fetchCompletedITs,
  fetchCompleteITsItems,
  retrieveItemDetailsByItemCodeInITR,

  /// ========================= Transfer Receive =========================
  fetchAllItemsOfTR,
  createTR,
  transferTransferRequestItems,
  fetchAllTR,

  /// ======================== Production Order =========================
  listAllProductionOrders,
  closeProductionOrderChecks,
  createProductionItr,
  listIssueFromProductionLines,
  listProductionOrderLines,
  addIssueFromProduction,
  addReceiptFromProduction,
  listVendors,
  getItrsGroupedByPoOrItem,
  getPendingItrsGroupedByPo,
  getPendingItrsGroupedByItemCode,
  getCompletedITGroupedByPo,
  getCompletedITGroupedByItemCode,
  fetchProductionOrderItemsGroupedByItemCode,
  fetchProductionOrderItemsGroupedByPoNumberInIT,
  getDeliveredItItemsListByItemCode,
  getDeliveredItItemsListByPoCodeInIT,
  getDeliveredTrItemsListByPoCodeInIT,
  completeDraftedInventoryTransfersInPOByItemCode,
  completeDraftedInventoryTransfersInPOByPo,
  createITAgainstProductionOrderItr,
  deleteDeliveredItemGroupedByItemCode,
  fetchCompletedITsItemsGroupedByItemCodeInProductionOrder,
  fetchCompletedITsItemsGroupedByPoCodeInProductionOrder,
  getPendingItemsByItemCodeInPoBasedTR,
  getPendingItemsByPoNumberInPoBasedTR,
  fetchCompletedTrsItemsGroupedByItemCodeInProductionOrder,
  fetchCompletedTrsItemsGroupedByPoCodeInProductionOrder,
  getPendingTRsGroupedByPo,
  getPendingTRsGroupedByItemCode,
  getCompletedTRGroupedByPo,
  getCompletedTRGroupedByItemCode,
  getDeliveredItItemsListByItemCodeInTR,
  getDeliveredItItemsListByPoCodeInTR,
  deleteDeliveredItemGroupedByItemCodeInTR,
  createTRAgainstProductionOrderIt,
  getItemDetailsByBarcodeInPOBasedIT,
  getItemDetailsByBarcodeInPOBasedTR,
  closeProductionOrder,
  completeDraftedTransferReceivesInPOByItemCode,
  completeDraftedTransferReceivesInPO,

  /// ======================== Good Issue =========================
  listAllResources,
  createGoodIssue,
  listDraftedGoodIssue,
  checkIfGoodIssueExists,
  completeDraftedGoodIssue,

  /// ======================== Issue For Production =========================
  listWorkShiftTypes,
  listSectionTypes,
  productionOrderRoute,
  addIssueFromProductionWithRoute,

  /// ======================== Physical Stock Check =========================
  listAllPhysicalStockCount,

  /// ======================== Purchase Order =========================
  listAllPurchaseOrders,
  listPendingPurchaseOrderLines,
  listDraftedPurchaseOrderLines,
  postItemToGRN,
  listAllPendingGRNs,
  listAllItemsPendingGRNs,
  proceedGoodReceiptNotes,
  deleteItemInPendingGrn,
  retrieveItemDetailsFromBarCodeInPurchaseOrder,
  getDashboardAnalytics,

  ///======================== Sales Order ========================
  listAllCustomersOfUser,
  listDraftedSalesOrderItems,
  listCompletedSalesOrderItems,
  createSalesOrder,
  removeItemFromSalesOrder,
  listAllSalesOrder,
  completeDraftedSalesOrder,

  /// ======================== Dispatch Order ========================
  /// ======================== Dispatch Order ========================
  listAllVehicles,
  listAllVehiclesByContractorId,
  listAllDrivers,
  createDispatchOrder,
  listDraftedDispatchOrderItems,
  completeDraftedDispatchOrder,
  listAllDispatchOrder,
  listCompletedDispatchOrderItems,
  listContractors,
  listVehicleTypes,
  listDriversByContractor;


  

  String get value {
    switch (this) {
      /// ================= Authentication =======================
      case ApiEndpoints.signup:
        return "signup";
      case ApiEndpoints.login:
        return "$_auth/login";
      case ApiEndpoints.logout:
        return "logout";
      case ApiEndpoints.refreshToken:
        return "$_auth/RefreshToken";

            case ApiEndpoints.productListing:
        return "carts";
              case ApiEndpoints.productAdd:
        return "posts/add";

      /// ==================== 2FA =====================
      case ApiEndpoints.get2FASecretKey:
        return "ExposedGetSecretKey";
      case ApiEndpoints.addOrUpdate2FA:
        return "$_auth/AddOrUpdate2FA";
      case ApiEndpoints.remove2FA:
        return "$_auth/Remove2FA";
      case ApiEndpoints.verifyOtp:
        return "ExposedVerifyCode";

      /// =========== Warehouse ===============
      case ApiEndpoints.warehousesListing:
        return "$_warehouse/ListAllWarehousesByUserId";

      /// =========== Inventory Transfer Request ===============
      case ApiEndpoints.retrieveItemDetailsFromBarCode:
        return "$_inventoryTransferRequest/GetItemDetailsByBarcode";
      case ApiEndpoints.listAllBinsByWarehouseCode:
        return "$_inventoryTransferRequest/ListAllBinCodesByWarehouseCode";
      case ApiEndpoints.listAllItemsByUserId:
        return "$_inventoryTransferRequest/ListAllItemsByUserId";
      case ApiEndpoints.getDefaultBinByWarehouseCodeAndItemCode:
        return "$_inventoryTransferRequest/GetDftBinByWarehouseAndItemCode";
      case ApiEndpoints.createITR:
        return "$_inventoryTransferRequest/CreateInventoryTransferRequest";
      case ApiEndpoints.fetchAllItemsOfITR:
        return "$_inventoryTransferRequest/ListAllItemsByWareHouseCodes";
      case ApiEndpoints.deleteItemFromITR:
        return "$_inventoryTransferRequest/DeleteItemInITR";
      case ApiEndpoints.getOpenItrDetailsByWarehouseAndItemCode:
        return "$_inventoryTransferRequest/GetOpenItrDetailsByWarehouseAndItemCode";
      case ApiEndpoints.checkIFITRExists:
        return "$_inventoryTransferRequest/CheckIFITRExists";
      case ApiEndpoints.listAllItrsByUser:
        return "$_inventoryTransferRequest/ListAllItrsByUser";
      case ApiEndpoints.listAllItr:
        return "$_inventoryTransferRequest/ListAllItr";
      case ApiEndpoints.listAllItrsInIT:
        return "$_inventoryTransferRequest/ListAllItrsInIT";

      /// =========== Inventory Transfer ===============
      // case ApiEndpoints.listAllIts:
      //   return "$_inventoryTransfer/ListAllItrsByUser";
      case ApiEndpoints.listDraftedItemsByWarehouseInIT:
        return "$_inventoryTransfer/ListItemsFromDraftedITsByWarehouses";
      case ApiEndpoints.postInventoryTransferToDraft:
        return "$_inventoryTransfer/CreateIT";
      case ApiEndpoints.deleteInventoryTransferItemFromDraft:
        return "$_inventoryTransfer/RemoveItemFromIt";
      case ApiEndpoints.transferInventoryTransferItems:
        return "$_inventoryTransfer/CompleteDraftedInventoryTransfers";
      case ApiEndpoints.retrieveItemDetailsByItemCodeInITR:
        return "$_inventoryTransfer/GetItemDetailsByBarcodeInITR";
      case ApiEndpoints.fetchCompletedITs:
        return "$_inventoryTransfer/ListAllCompletedITs";
      case ApiEndpoints.fetchCompleteITsItems:
        return "$_inventoryTransfer/ListAllCompletedITsItems";

      /// =========== Transfer Receive ===============

      case ApiEndpoints.fetchAllTR:
        return "$_productionOrder/ListAllItsGroupbyWarehouses";
      case ApiEndpoints.fetchAllItemsOfTR:
        return "$_transferReceive/ListDraftedItemsByWarehouses";
      case ApiEndpoints.createTR:
        return "$_transferReceive/CreateTransferReceive";
      case ApiEndpoints.transferTransferRequestItems:
        return "$_transferReceive/CompleteDraftedTRs";

      /// ============== Production Order ===============
      case ApiEndpoints.createProductionItr:
        return "$_productionOrder/CreateProductionOrderItr";
      case ApiEndpoints.addIssueFromProduction:
        return "$_productionOrder/AddIssueForProduction";
      case ApiEndpoints.addReceiptFromProduction:
        return "$_receiptFromProduction/AddReceiptFromProduction";
      case ApiEndpoints.getItrsGroupedByPoOrItem:
        return "$_productionOrder/GetItrsGroupedByPoOrItem";
      case ApiEndpoints.getPendingItrsGroupedByPo:
        return "$_productionOrder/GetPendingItrsGroupedByPO";
      case ApiEndpoints.getPendingItrsGroupedByItemCode:
        return "$_productionOrder/GetPendingItrsGroupedByItemCode";
      case ApiEndpoints.getCompletedITGroupedByPo:
        return "$_productionOrder/GetCompletedITGroupedByPO";
      case ApiEndpoints.getCompletedITGroupedByItemCode:
        return "$_productionOrder/GetCompletedITGroupedByItemCode";
      case ApiEndpoints.fetchProductionOrderItemsGroupedByItemCode:
        return "$_productionOrder/GetItemsListByItemCode";
      case ApiEndpoints.fetchProductionOrderItemsGroupedByPoNumberInIT:
        return "$_productionOrder/GetItemsListByPONumber";
      case ApiEndpoints.getDeliveredItItemsListByItemCode:
        return "$_productionOrder/GetDeliveredITItemsByItemCode";
      case ApiEndpoints.getDeliveredItItemsListByPoCodeInIT:
        return "$_productionOrder/GetDeliveredITItemsByPO";
      case ApiEndpoints.getDeliveredTrItemsListByPoCodeInIT:
        return "$_productionOrder/GetDeliveredTrItemsByPO";
      case ApiEndpoints.completeDraftedInventoryTransfersInPOByItemCode:
        return "$_productionOrder/CompleteDraftedInventoryTransfersInPOByItemCode";
      case ApiEndpoints.completeDraftedInventoryTransfersInPOByPo:
        return "$_productionOrder/CompleteDraftedInventoryTransfersInPO";
      case ApiEndpoints.createITAgainstProductionOrderItr:
        return "$_productionOrder/CreateITAgainstProductionOrderItr";
      case ApiEndpoints.deleteDeliveredItemGroupedByItemCode:
        return "$_productionOrder/RemoveItemFromPOInventoryTransfer";
      case ApiEndpoints.completeDraftedTransferReceivesInPOByItemCode:
        return "$_productionOrder/CompleteDraftedTransferReceivesInPOByItemCode";
      case ApiEndpoints.completeDraftedTransferReceivesInPO:
        return "$_productionOrder/CompleteDraftedTransferReceivesInPO";

      /// ======================== Forget Password =========================
      case ApiEndpoints.forgetPassword:
        return "$_auth/ForgetPassword";
      case ApiEndpoints.verifyOtpForForgetPassword:
        return "$_auth/VerifyOTP";
      case ApiEndpoints.resetPassword:
        return "$_auth/CreateNewPasswordAfterOTP";
      case ApiEndpoints.changePassword:
        return "$_auth/ChangePassword";

      /// ======================== Purchase Order =========================
      case ApiEndpoints.postItemToGRN:
        return "$_purchaseOrder/AddItemsInGoodsReceivedNote";
      case ApiEndpoints.listAllPendingGRNs:
        return "$_purchaseOrder/ListAllPendingGRNs";
      case ApiEndpoints.listAllItemsPendingGRNs:
        return "$_purchaseOrder/ListAllItemsInPendingGRN";
      case ApiEndpoints.proceedGoodReceiptNotes:
        return "$_purchaseOrder/CompletePendingGRNs";
      case ApiEndpoints.deleteItemInPendingGrn:
        return "$_purchaseOrder/removeIteminGrn";
      case ApiEndpoints.retrieveItemDetailsFromBarCodeInPurchaseOrder:
        return "$_purchaseOrder/GetItemDetailsByBarcodeInPO";
      case ApiEndpoints.listAllPurchaseOrders:
        return "$_purchaseOrder/ListAllPurchaseOrders";
      case ApiEndpoints.listPendingPurchaseOrderLines:
        return "$_purchaseOrder/ListPendingPurchaseOrderLines";
      case ApiEndpoints.listDraftedPurchaseOrderLines:
        return "$_purchaseOrder/ListDeliveredItemsInPurchaseOrderGRN";

      /// ======================== Get Dashboard Analytics =========================
      case ApiEndpoints.getDashboardAnalytics:
        return "$_dashboard/GetDashboardAnalytics";

      /// ======================== Production Order =========================
      case ApiEndpoints
          .fetchCompletedITsItemsGroupedByItemCodeInProductionOrder:
        return "$_productionOrder/GetCompletedItemsByItemCodeInIT";
      case ApiEndpoints.fetchCompletedITsItemsGroupedByPoCodeInProductionOrder:
        return "$_productionOrder/GetCompletedItemsByPoNumberInIT";
      case ApiEndpoints
          .fetchCompletedTrsItemsGroupedByItemCodeInProductionOrder:
        return "$_productionOrder/GetCompletedTRItemsByItemCode";
      case ApiEndpoints.fetchCompletedTrsItemsGroupedByPoCodeInProductionOrder:
        return "$_productionOrder/GetCompletedTRItemsByPoNumber";
      case ApiEndpoints.getPendingTRsGroupedByPo:
        return "$_productionOrder/GetPendingTRsGroupedByPO";
      case ApiEndpoints.getPendingTRsGroupedByItemCode:
        return "$_productionOrder/GetPendingTRsGroupedByItemCode";
      case ApiEndpoints.getCompletedTRGroupedByPo:
        return "$_productionOrder/GetCompletedTRGroupedByPO";
      case ApiEndpoints.getCompletedTRGroupedByItemCode:
        return "$_productionOrder/GetCompletedTRGroupedByItemCode";
      case ApiEndpoints.deleteDeliveredItemGroupedByItemCodeInTR:
        return "$_productionOrder/RemoveItemFromPOTransferReceive";
      case ApiEndpoints.createTRAgainstProductionOrderIt:
        return "$_productionOrder/CreatePoBasedTransferReceive";
      case ApiEndpoints.getDeliveredItItemsListByItemCodeInTR:
        return "$_productionOrder/GetDeliveredTRItemsByItemCode";
      case ApiEndpoints.getDeliveredItItemsListByPoCodeInTR:
        return "$_productionOrder/GetDeliveredTRItemsByPO";
      case ApiEndpoints.getItemDetailsByBarcodeInPOBasedIT:
        return "$_productionOrder/GetItemDetailsByBarcodeInPOBasedIT";
      case ApiEndpoints.getItemDetailsByBarcodeInPOBasedTR:
        return "$_productionOrder/GetItemDetailsByBarcodeInPOBasedTR";
      case ApiEndpoints.closeProductionOrder:
        return "$_productionOrder/CloseProductionOrder";
      case ApiEndpoints.getPendingItemsByItemCodeInPoBasedTR:
        return "$_productionOrder/GetPendingItemsByItemCodeInPoBasedTR";
      case ApiEndpoints.getPendingItemsByPoNumberInPoBasedTR:
        return "$_productionOrder/GetPendingItemsByPoNumberInPoBasedTR";

      ///  ======================= Issue ForProduction =========================
      case ApiEndpoints.addIssueFromProductionWithRoute:
        return "$_issueForProduction/AddIssueForProductionWithRoute";
      case ApiEndpoints.listWorkShiftTypes:
        return "$_issueForProduction/ListWorkShiftTypes";
      case ApiEndpoints.listSectionTypes:
        return "$_issueForProduction/ListSectionTypes";

      /// ============================== SAP ================================
      case ApiEndpoints.listAllProductionOrders:
        return "$_sap/ListProductionOrdersByUser";
      case ApiEndpoints.closeProductionOrderChecks:
        return "$_productionOrder/CloseProductionOrderChecks";
      case ApiEndpoints.listProductionOrderLines:
        return "$_sap/ListProductionOrderLines";
      case ApiEndpoints.listIssueFromProductionLines:
        return "$_sap/ListIssueForProduction";
      case ApiEndpoints.listAllPhysicalStockCount:
        return "$_sap/ListAllPhysicalStockCount";
      case ApiEndpoints.listVendors:
        return "$_sap/ListBusinessPartnerVendors";
      case ApiEndpoints.productionOrderRoute:
        return "$_sap/ListProductionOrderStages";

      /// ======================== Good Issue =========================
      case ApiEndpoints.listAllResources:
        return "$_goodIssue/ListAllResources";
      case ApiEndpoints.createGoodIssue:
        return "$_goodIssue/CreateGoodIssue";
      case ApiEndpoints.listDraftedGoodIssue:
        return "$_goodIssue/ListDraftedGoodIssue";
      case ApiEndpoints.checkIfGoodIssueExists:
        return "$_goodIssue/ListDraftedGoodIssue";
      case ApiEndpoints.completeDraftedGoodIssue:
        return "$_goodIssue/CompleteDraftedGoodIssue";

      /// ======================== Sales Order=========================
      case ApiEndpoints.listAllCustomersOfUser:
        return "$_businessPartner/ListAllCustomersOfUser";
      case ApiEndpoints.listDraftedSalesOrderItems:
        return "$_salesOrder/ListDraftedSalesOrderItems";
      case ApiEndpoints.listCompletedSalesOrderItems:
        return "$_salesOrder/ListCompletedSalesOrderItems";
      case ApiEndpoints.createSalesOrder:
        return "$_salesOrder/CreateSalesOrder";
      case ApiEndpoints.removeItemFromSalesOrder:
        return "$_salesOrder/RemoveItemFromSalesOrder";
      case ApiEndpoints.listAllSalesOrder:
        return "$_salesOrder/ListAllSalesOrder";
      case ApiEndpoints.completeDraftedSalesOrder:
        return "$_salesOrder/CompleteDraftedSalesOrder";
      case ApiEndpoints.listAllVehicles:
        return "$_vehicle/ListAllVehicles";
      case ApiEndpoints.listAllDrivers:
        return "$_driver/GetDriversByVehicleNumber";
      case ApiEndpoints.createDispatchOrder:
        return "$_dispatch/CreateDispatchOrder";
      case ApiEndpoints.listDraftedDispatchOrderItems:
        return "$_dispatch/ListDraftedDispatchOrderItems";
      case ApiEndpoints.completeDraftedDispatchOrder:
        return "$_dispatch/CompleteDraftedDispatchOrder";

      /// ==================================================
      case ApiEndpoints.listAllVehicles:
        return "$_vehicle/ListAllVehicles";
      case ApiEndpoints.listAllVehiclesByContractorId:
        return "$_vehicle/ListAllVehiclesByContractorId";
      case ApiEndpoints.listAllDrivers:
        return "$_driver/GetDriversByVehicleNumber";
      case ApiEndpoints.createDispatchOrder:
        return "$_dispatch/CreateDispatchOrder";
      case ApiEndpoints.listAllDispatchOrder:
        return "$_dispatch/ListAllDispatchOrder";
      case ApiEndpoints.listCompletedDispatchOrderItems:
        return "$_dispatch/ListCompletedDispatchOrderItems";
      case ApiEndpoints.listContractors:
        return "$_contractor/ListAllContractors";
      case ApiEndpoints.listVehicleTypes:
        return "$_vehicle/ListAllVehicleTypes";
      case ApiEndpoints.listDriversByContractor:
        return "$_driver/GetDriversByContractorId";
      case ApiEndpoints.listDraftedDispatchOrderItems:
        return "$_dispatch/ListDraftedDispatchOrderItems";
      case ApiEndpoints.completeDraftedDispatchOrder:
        return "$_dispatch/CompleteDraftedDispatchOrder";
    }
  }
}
