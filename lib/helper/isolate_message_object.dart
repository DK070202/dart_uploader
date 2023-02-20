part of dart_uploader;

/// A object which helps to communicate between two isolates.
class SendPortMessageObject<T extends Object?> {
  /// Name of method which is going to be invoked in isolate.
  final String name;

  /// Expected data type which is going to be received on opposite isolate.
  final T data;

  const SendPortMessageObject({
    required this.name,
    required this.data,
  });

  /// Parses the data from the [rawMessage] and casts.
  factory SendPortMessageObject.fromRaw(List<dynamic> rawMessage) {
    return SendPortMessageObject(
      name: rawMessage.first,
      data: rawMessage[1] as T,
    );
  }

  /// Converts this into data type which sendPort can send to the opposite
  /// isolate.
  List<dynamic> toRow() {
    return [name, data];
  }
}
