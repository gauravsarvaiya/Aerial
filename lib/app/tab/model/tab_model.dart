class IconTextData {
  String? icon;
  String? name;

  IconTextData({this.icon, this.name});
}

List<IconTextData> tabList = [
  IconTextData(icon: "/home.svg", name: "Home"),
  IconTextData(icon: "/spares.svg", name: "Explore Spare"),
  IconTextData(icon: "/inquiry.svg", name: "Spare Inquiries"),
  IconTextData(icon: "/tickets.svg", name: "Service Tickets"),
];