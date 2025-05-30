import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

enum InventoryLoadingStatus { initial, loading, success, failure }

final class InventoryStates extends Equatable {
  final InventoryLoadingStatus loadingStatus;
  final Map<String, String>? inventoryData;
  final String? error;

  const InventoryStates({
    this.inventoryData,
    this.error,
    this.loadingStatus = InventoryLoadingStatus.initial,
  });

  InventoryStates copyWith({
    InventoryLoadingStatus? loadingStatus,
    Map<String, String>? inventoryData,
    String? error,
  }) {
    return InventoryStates(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      inventoryData: inventoryData ?? this.inventoryData,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    loadingStatus,
    DeepCollectionEquality().hash(inventoryData),
    error,
  ];
}
