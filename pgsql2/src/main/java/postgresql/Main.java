package postgresql;

import java.sql.Connection;
import java.sql.DriverManager;

// CREATe TABLE "homicide_data"("id" SERIAL8  PRIMARY KEY UNIQUE,"state" VARCHAR NOT NULL,"year" INT8
// NOT NULL,"month" INT8 NOT NULL,"crime_solved" BOOLEAN NOT NULL,"victim_sex" VARCHAR NOT NULL,
// "victim_age" INT8 NOT NULL,"victim_race" VARCHAR NOT NULL,"perpetrator_sex" VARCHAR NOT NULL,
// "perpetrator_age" VARCHAR NOT NULL,"perpetrator_race" VARCHAR NOT NULL,"relationship" VARCHAR NOT NULL,
// "victim_count" INT8 NOT NULL,"weapon" VARCHAR NOT NULL)
public class Main {

  public static void main(String[] args) {
    Connection c = null;
    try {
      Class.forName("org.postgresql.Driver");
      c = DriverManager
          .getConnection("jdbc:postgresql://localhost:5432/postgres",
              "postgres", "root");
      CssConverter cssConverter = new CssConverter(c);
      cssConverter.execute();
    } catch (Exception e) {
      e.printStackTrace();
      System.err.println(e.getClass().getName()+": "+e.getMessage());
      System.exit(0);
    }
    System.out.println("Opened database successfully");
  }
}
