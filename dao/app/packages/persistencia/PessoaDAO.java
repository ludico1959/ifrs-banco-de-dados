package app.packages.persistencia;

import java.sql.*;
import java.util.ArrayList;
import app.packages.negocio.Pessoa;

public class PessoaDAO {
  public ArrayList<Pessoa> listar() throws SQLException {
    ArrayList<Pessoa> vetorPessoa = new ArrayList<Pessoa>();
    String sql = "SELECT * FROM pessoa";

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

    return vetorPessoa;
  }
}
