package postgresql;

public class HomicideData {
  private String state;
  private int year;
  private String month;
  private boolean crimeSolved;
  private String victimSex;
  private int victimAge;
  private String victimRace;
  private String perpetratorSex;
  private String perpetratorAge;
  private String perpetratorRace;
  private String relationship;
  private String weapon;
  private int victimCount;

  public HomicideData(String state, int year, String month, boolean crimeSolved,
      String victimSex, int victimAge, String victimRace, String perpetratorSex,
      String perpetratorAge, String perpetratorRace, String relationShip, String weapon,
      int victimCount) {
    this.state = state;
    this.year = year;
    this.month = month;
    this.crimeSolved = crimeSolved;
    this.victimSex = victimSex;
    this.victimAge = victimAge;
    this.victimRace = victimRace;
    this.perpetratorSex = perpetratorSex;
    this.perpetratorAge = perpetratorAge;
    this.perpetratorRace = perpetratorRace;
    this.relationship = relationShip;
    this.weapon = weapon;
    this.victimCount = victimCount;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public int getYear() {
    return year;
  }

  public void setYear(int year) {
    this.year = year;
  }

  public String getMonth() {
    return month;
  }

  public void setMonth(String month) {
    this.month = month;
  }

  public boolean isCrimeSolved() {
    return crimeSolved;
  }

  public void setCrimeSolved(boolean crimeSolved) {
    this.crimeSolved = crimeSolved;
  }

  public String getVictimSex() {
    return victimSex;
  }

  public void setVictimSex(String victimSex) {
    this.victimSex = victimSex;
  }

  public int getVictimAge() {
    return victimAge;
  }

  public void setVictimAge(int victimAge) {
    this.victimAge = victimAge;
  }

  public String getVictimRace() {
    return victimRace;
  }

  public void setVictimRace(String victimRace) {
    this.victimRace = victimRace;
  }

  public String getPerpetratorSex() {
    return perpetratorSex;
  }

  public void setPerpetratorSex(String perpetratorSex) {
    this.perpetratorSex = perpetratorSex;
  }

  public String getPerpetratorAge() {
    return perpetratorAge;
  }

  public void setPerpetratorAge(String perpetratorAge) {
    this.perpetratorAge = perpetratorAge;
  }

  public String getPerpetratorRace() {
    return perpetratorRace;
  }

  public void setPerpetratorRace(String perpetratorRace) {
    this.perpetratorRace = perpetratorRace;
  }

  public String getRelationship() {
    return relationship;
  }

  public void setRelationship(String relationship) {
    this.relationship = relationship;
  }

  public String getWeapon() {
    return weapon;
  }

  public void setWeapon(String weapon) {
    this.weapon = weapon;
  }

  public int getVictimCount() {
    return victimCount;
  }

  public void setVictimCount(int victimCount) {
    this.victimCount = victimCount;
  }

  // CREATe TABLE "homicide_data"("id" SERIAL8  PRIMARY KEY UNIQUE,"state" VARCHAR NOT NULL,"year" INT8
// NOT NULL,"month" INT8 NOT NULL,"crime_solved" BOOLEAN NOT NULL,"victim_sex" VARCHAR NOT NULL,
// "victim_age" INT8 NOT NULL,"victim_race" VARCHAR NOT NULL,"perpetrator_sex" VARCHAR NOT NULL,
// "perpetrator_age" VARCHAR NOT NULL,"perpetrator_race" VARCHAR NOT NULL,"relationship" VARCHAR NOT NULL,
// "victim_count" INT8 NOT NULL,"weapon" VARCHAR NOT NULL)

  public String toSqlValue(){
    String sqlValue = "VALUES (";
    sqlValue += "\'"+ this.getState() +"\'" + ",";
    sqlValue += this.getYear() + ",";
    sqlValue += "\'" + this.getMonth() +"\'" + ",";
    sqlValue += ((this.isCrimeSolved()) ? "TRUE" : "FALSE") + ",";
    sqlValue += "\'" + this.getVictimSex() + "\'" + ",";
    sqlValue += this.getVictimAge() + ",";
    sqlValue += "\'" + this.getVictimRace() + "\'" + ",";
    sqlValue += "\'" + this.getPerpetratorSex() + "\'" + ",";
    sqlValue += "\'" + this.getPerpetratorAge() + "\'" + ",";
    sqlValue += "\'" + this.getPerpetratorRace() + "\'" + ",";
    sqlValue += "\'" + this.getRelationship() + "\'" + ",";
    sqlValue += this.getVictimCount() + ",";
    sqlValue += "\'" + this.weapon + "\'";
    sqlValue += ");";
    return sqlValue;
  }
}
