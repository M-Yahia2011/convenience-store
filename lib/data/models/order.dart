
/// an Order model for the UI
class Order {
  final String id;
  final String orderDateTime;
  final String total;
  final List<String> orderedItemsIDs;
  Order(this.id, this.orderDateTime, this.total, this.orderedItemsIDs);
  
}
