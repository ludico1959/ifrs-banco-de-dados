package src.persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexaoPostgreSQL {
  private String host;
  private String port;
  private String username;
  private String password;
  private String database;
  
  public ConexaoPostgreSQL() {
    this.host = "localhost";
    this.port = "5460"; // a padrão é 5432
    this.username = "postgres";
    this.password = "postgres";
    this.database = "dao";
  }

  public Connection getConnection() {
    String url = "jdbc:postgresql://" + this.host + ":" + this.port + "/" + this.database;

    try {
      System.out.println("Conectando ao banco de dados...");
      return DriverManager.getConnection(url, username, password);
    } catch (SQLException ex) {
      System.out.println("Problema ao conectar ao banco de dados");
      Logger.getLogger(ConexaoPostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
    }

    return null;
  }
}
