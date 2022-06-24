package src.apresentacao;

import java.sql.SQLException;
import java.util.ArrayList;

import src.negocio.Pessoa;
import src.persistencia.PessoaDAO;

public class Main {
  public static void main(String[] args) throws SQLException {
    // inserir
    new PessoaDAO().inserir(new Pessoa("666.168.810-67", "Ismael Castelhano Milheiro"));

    // excluir
    new PessoaDAO().excluir("666.168.810-67");

    // atualizar
    new PessoaDAO().atualizar(new Pessoa("199.614.880-08", "Mael Guadalajara Milheiro"));

    // listar
    ArrayList<Pessoa> vetorPessoa = new PessoaDAO().listar();
    for (int i = 0; i < vetorPessoa.size(); i++) {
      Pessoa pessoa = vetorPessoa.get(i);
      System.out.println("Nome: " + pessoa.getNome());
    }
  }
}