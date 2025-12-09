final class AppErrors {
  AppErrors._();
  static const emptyField = "This field cannot be empty";
  static const shortPassword = "Password must be at least 6 characters";
  static const invalidEmail = "Enter a valid email address";
  static const featureNotImplementedYet = "Feature not implemented yet";
  static const somethingWentWrong = "Something went wrong";
  static const selectAtleastOneRole = "Select at least one role";
  static const selectAtleastOneWarehouse = "Select at least one warehouse";
  static const selectWareHousesToProceed = "Select warehouses to proceed";
  static const selectDataToProceed = "Select data to proceed";
  static const addItemsToProceed = "Add items to proceed";
  static const noInternetConnection = "No Internet Connection";
  static const noInternetTitle = 'No Internet Connection';
  static const enterProduceQuantity = "Enter Produce Quantity";
  static const addQuantityToProceed = "Add Quantity in lines to proceed.";
  static const errorReadingBarcode = "Error reading barcode.";
  static const selectStatusToProceed = "Select Status.";
  static const noInternetSubtitle =
      'Please check your connection and try again.';
  static const sourceAndDestinationWarehouseSame =
      "Source and destination warehouses can't be same.";
  static const String noIssuesFoundForProduction =
      "No issues found for this production order";
  static const String quantityExceedsRemaining =
      "Entered quantity exceeds the remaining quantity";
  static const String required = "Required";
  static const String invalidQuantity = "Invalid Quantity";
  static const String addVendorReferenceToProceed =
      'Add Vendor Reference to Proceed';
  static const String selectUserOfMeasurement =
      "Please select a unit of measurement (UOM).";
  static const String timeoutTryAgain =
      "Connection timed out. Please try again.";
  static const String noVendorFound = "No vendor found.";
  static const String noBinsFound = "No Bins Found.";
  static const String barcodeRequired = "Barcode required.";
  static const String selectVendorToProceed = "Select a vendor to proceed.";
  static const String selectWarehouseToProceed =
      "Select a warehouse to proceed.";
  static const String noResourcesFound = "No resources found.";
}
