package postgresql;

import com.opencsv.CSVReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CssConverter {
  // CREATe TABLE "homicide_data"("id" SERIAL8  PRIMARY KEY UNIQUE,"state" VARCHAR NOT NULL,"year" INT8
// NOT NULL,"month" INT8 NOT NULL,"crime_solved" BOOLEAN NOT NULL,"victim_sex" VARCHAR NOT NULL,
// "victim_age" INT8 NOT NULL,"victim_race" VARCHAR NOT NULL,"perpetrator_sex" VARCHAR NOT NULL,
// "perpetrator_age" VARCHAR NOT NULL,"perpetrator_race" VARCHAR NOT NULL,"relationship" VARCHAR NOT NULL,
// "victim_count" INT8 NOT NULL,"weapon" VARCHAR NOT NULL)
  private String insertDatabase = "INSERT INTO homicide_data (state,year,month,crime_solved,victim_sex,"
      + "victim_age,victim_race, perpetrator_sex, perpetrator_age, perpetrator_race, relationship, victim_count, weapon)";

  private Connection connection;
  private Statement stm;
  public CssConverter(Connection connection){
    this.connection = connection;
  }

  public void execute() throws IOException, SQLException {
    String csvFile = "database2.csv";
    InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream(csvFile);
    InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
    Reader reader = inputStreamReader;
    CSVReader csvReader = new CSVReader(reader);
    // Reading Records One by One in a String array
    String[] nextRecord;
    csvReader.readNext();
    this.connection.setAutoCommit(false);
    this.stm = this.connection.createStatement();
    ArrayList<HomicideData> homicideDataArrayList = new ArrayList<>();
    while((nextRecord = csvReader.readNext()) != null){
        String[] hd = nextRecord;
        HomicideData homicideData = new HomicideData(hd[0],
            Integer.parseInt(hd[1]),
            hd[2],
            convertToBoolean(hd[3]),
            hd[4],
            Integer.parseInt(hd[5]),
            hd[6],
            hd[7],
            hd[8],
            hd[9],
            hd[10],
            hd[11],
            Integer.parseInt(hd[12]));
      String values = homicideData.toSqlValue();
      String sql = this.insertDatabase + values;
      stm.executeUpdate(sql);
    }
    stm.close();
    connection.commit();
    connection.close();
  }

  public boolean convertToBoolean(String crimeSolved){
    if(crimeSolved.equalsIgnoreCase("Yes")){
      return true;
    }else{
      return false;
    }
  }

}
