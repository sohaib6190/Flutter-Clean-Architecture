import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';


import '../errors/api_exceptions.dart';
import '../models/paginated_response.dart';

class CommonFunctions {
  CommonFunctions._();




  static Future<int> handlePaginatedCall<T, TState, TLoadedState>({
    required Emitter<TState> emit,
    required TState currentState,
    required Future<Either<Failure, PaginatedResponse<T>>> Function(
      int skip,
      int size,
    )
    apiCall,
    required TState loadingState,
    required TState Function(List<T> items, int total, bool hasMore)
    successState,
    required TState Function(String error) errorState,
    required List<T> Function(TLoadedState state) getItems,
    required int Function(TLoadedState state) getTotal,
    required int currentSkip,
    required int pageSize,
    required bool refresh,
  }) async {
    // Reset skip on refresh
    final skip = refresh ? 0 : currentSkip;

    List<T> currentItems = [];
    int totalCount = 0;

    // Get current data if loaded
    if (currentState is TLoadedState) {
      currentItems = getItems(currentState);
      totalCount = getTotal(currentState);

      // Early return if all data loaded
      if (currentItems.length >= totalCount && !refresh) {
        return currentSkip;
      }
    }

    // Show loading for first load or refresh
    if (refresh || currentState is! TLoadedState) {
      emit(loadingState);
    }

    final result = await apiCall(skip, pageSize);

    result.fold((failure) => emit(errorState(failure.message)), (response) {
      final newItems = response.items ?? [];
      final total = response.totalCount ?? 0;
      final allItems =
          refresh || currentState is! TLoadedState
              ? newItems
              : [...currentItems, ...newItems];
      final hasMore = total > allItems.length;

      emit(successState(allItems, total, hasMore));
    });

    return skip + pageSize;
  }

  ///================== Logging Utility ==================///
  // static void logRouteDataPayload(IssueForProductionWithRouteParams params) {
  //   // Log the complete payload for debugging
  //   debugPrint('=== ISSUE FOR PRODUCTION WITH ROUTE PAYLOAD ===');
  //   debugPrint('Warehouse Code: ${params.wareHouseCode}');
  //   debugPrint('Route: ${params.route}');
  //   debugPrint('Document Absolute Entry: ${params.documentAbsoluteEntry}');
  //   debugPrint('Document Number: ${params.documentNumber}');
  //   debugPrint('Total Lines: ${params.lines.length}');
  //   debugPrint('Lines Details:');
  //   for (int i = 0; i < params.lines.length; i++) {
  //     final line = params.lines[i];
  //     debugPrint('  Line $i: ${line.toString()}');
  //   }
  //   //  debugPrint('Resource Details Map: $_resourceDetailsMap');
  //   debugPrint('==============================================');
  // }
}
