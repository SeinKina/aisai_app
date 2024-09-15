class QuestModel {
  final int qid;
  final List<int> uidList;
  final int eid;
  final List<DateTime> arriveedTimes;
  final bool questCompleteFlag;

  QuestModel({
    required this.qid,
    required this.uidList,
    required this.eid,
    required this.arriveedTimes,
    required this.questCompleteFlag,
  });
}
