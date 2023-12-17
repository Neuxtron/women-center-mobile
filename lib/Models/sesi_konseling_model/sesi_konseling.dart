class CounselingSession {
  final String bookingId;
  final String userId;
  final String fullname;
  final String packageType;
  final String dateSchedule;
  final String timeStart;
  final String timeFinish;

  CounselingSession({
    required this.bookingId,
    required this.userId,
    required this.fullname,
    required this.packageType,
    required this.dateSchedule,
    required this.timeStart,
    required this.timeFinish,
  });

  factory CounselingSession.fromJson(Map<String, dynamic> json) {
    return CounselingSession(
      bookingId: json['booking_id'],
      userId: json['user_id'],
      fullname: json['fullname'],
      packageType: json['package'],
      dateSchedule: json['date_schedule'],
      timeStart: json['time_start'],
      timeFinish: json['time_finish'],
    );
  }
}
