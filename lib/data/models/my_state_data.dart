class MyStateData {
  String _state;
  String _stateCode;

  String _stateNotes;
  int _active;
  int _confirmed;
  int _deaths;
  int _recovered;
  int _todayConfirmed;
  int _todayRecovered;
  int _todayDeaths;
  int _todayActive;

  MyStateData({String state, String stateCode, String lastUpdatedTime, String stateNotes, int active, int confirmed, int deaths, int recovered, int todayConfirmed, int todayRecovered, int todayDeaths}) {
    this._state = state;
    this._stateCode = stateCode;

    this._stateNotes = stateNotes;
    this._active = active;
    this._confirmed = confirmed;
    this._deaths = deaths;
    this._recovered = recovered;

  }

  factory MyStateData.fromJson(Map<String, dynamic> json) {
    return MyStateData(
      state: json["state"],
      stateCode: json["statecode"],
      lastUpdatedTime: json["lastupdatedtime"],
      stateNotes: json["statenotes"],
      active: int.tryParse(json["active"]) ?? 0,
      confirmed: int.tryParse(json["confirmed"]) ?? 0,
      recovered: int.tryParse(json["recovered"]) ?? 0,
      deaths: int.tryParse(json["deaths"]) ?? 0,

    );
  }



  set state(String state) => this._state = state;
  set stateCode(String stateCode) => this._stateCode = stateCode;

  set stateNotes(String stateNotes) => this._stateNotes = stateNotes;
  set active(int active) => this._active = active;
  set confirmed(int confirmed) => this._confirmed = confirmed;
  set deaths(int deaths) => this._deaths = deaths;
  set recovered(int recovered) => this._recovered = recovered;

  String get state => this._state;
  String get stateCode => this._stateCode;

  String get stateNotes => this._stateNotes;
  int get active => this._active;
  int get confirmed => this._confirmed;
  int get deaths => this._deaths;
  int get recovered => this._recovered;
  int get todayConfirmed => this._todayConfirmed;


  @override
  String toString() {
    String data = "state: " + _state + ", stateCode: " + _stateCode + ", lastUpdatedTime: " + ", stateNotes: " + _stateNotes + ", active: " + _active.toString() + ", confirmed:" + _confirmed.toString() + ", deaths: " + _deaths.toString() + ", recovered:" + _recovered.toString() + ", todayConfirmed:" + _todayConfirmed.toString() + ", todayRecovered:" + _todayRecovered.toString() + ", todayDeaths: " + _todayDeaths.toString() + ", todayActive: " + _todayActive.toString();

    return data;
  }
}
