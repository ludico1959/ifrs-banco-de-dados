package app.packages.apresentacao;

import java.sql.SQLException;
import java.util.ArrayList;

import app.packages.negocio.Pessoa;
import app.packages.persistencia.PessoaDAO;
// import app.packages.persistencia.ConexaoPostgreSQL;

public class Main {
  public static void main(String[] args) throws SQLException {
    // System.out.println("Hello world!");

    // teste de conexão:
    // ConexaoPostgreSQL conexaoDB = new ConexaoPostgreSQL();
    // conexaoDB.getConnection();

    ArrayList<Pessoa> vetorPessoa = new PessoaDAO().listar();

    for (int i = 0; i < vetorPessoa.size(); i++) {
      Pessoa pessoa = vetorPessoa.get(i);
      System.out.println("Nome: " + pessoa.getNome());
    }
  }
}