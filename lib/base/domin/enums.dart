part of "../base.dart";

enum Status { loading, completed, error, unAuthorised }

enum NetworkMethod {
  get(value: "GET"),
  post(value: "POST");

  const NetworkMethod({required this.value});

  final String value;
}

enum TicketStatus {All,Pending,InProgress,Rejected,Assigned,Completed,Cancelled}

enum CmsType {terms,privacy,about}


enum TermDataType {
  subAssembly(value: "SubAssembly"),
  machineType(value: "MachineType"),
  assembly(value: "Assembly");

  const TermDataType({required this.value});

  final String value;
}


