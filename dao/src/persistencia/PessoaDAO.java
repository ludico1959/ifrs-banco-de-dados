package src.persistencia;

import java.sql.*;
import java.util.ArrayList;

import src.negocio.Pessoa;

public class PessoaDAO {
  public ArrayList<Pessoa> listar() throws SQLException {
    ArrayList<Pessoa> vetorPessoa = new ArrayList<Pessoa>();
    String sql = "SELECT * FROM pessoa;";

    Connection conexao = new ConexaoPostgreSQL().getConnection();
    PreparedStatement preparedStatement = conexao.prepareStatement(sql);
    ResultSet resultado = preparedStatement.executeQuery();

    Pessoa pessoa = null;
    
    while(resultado.next()) {
      pessoa = new Pessoa();
      pessoa.setId(resultado.getInt("id"));
      pessoa.setCpf(resultado.getString("cpf"));
      pessoa.setNome(resultado.getString("nome"));

      vetorPessoa.add(pessoa);
    }

    preparedStatement.close();
    conexao.close();

    return vetorPessoa;
  }

  public void inserir(Pessoa pessoa) throws SQLException {
    String sql = "INSERT INTO pessoa (cpf, nome) VALUES (?, ?);";

    Connection conexao = new ConexaoPostgreSQL().getConnection();
    PreparedStatement preparedStatement = conexao.prepareStatement(sql);
    preparedStatement.setString(1, pessoa.getCpf());
    preparedStatement.setString(2, pessoa.getNome());
    preparedStatement.execute();

    preparedStatement.close();
    conexao.close();
  }

  public void excluir(String cpf) throws SQLException {
    String sql = "DELETE FROM pessoa WHERE cpf = ?;";

    Connection conexao = new ConexaoPostgreSQL().getConnection();
    PreparedStatement preparedStatement = conexao.prepareStatement(sql);
    preparedStatement.setString(1, cpf);
    preparedStatement.execute();

    preparedStatement.close();
    conexao.close();
  }

  public void atualizar(Pessoa pessoa) throws SQLException {
    String sql = "UPDATE pessoa SET INSERT INTO pessoa (cpf, nome) VALUES (?, ?);";

    Connection conexao = new ConexaoPostgreSQL().getConnection();
    PreparedStatement preparedStatement = conexao.prepareStatement(sql);
    preparedStatement.setString(1, pessoa.getCpf());
    preparedStatement.setString(2, pessoa.getNome());
    preparedStatement.execute();

    preparedStatement.close();
    conexao.close();
  }
}

