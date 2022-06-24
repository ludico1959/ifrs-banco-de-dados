package src.negocio;

public class Pessoa {
  private int id;
  private String cpf;
  private String nome;

  public Pessoa(String cpf, String nome) {
    this.cpf = cpf;
    this.nome = nome;
  }

  public Pessoa() {

  }

  public int getId() {
    return this.id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getCpf() {
    return this.cpf;
  }

  public void setCpf(String cpf) {
    this.cpf = cpf;
  }

  public String getNome() {
    return this.nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }
}
