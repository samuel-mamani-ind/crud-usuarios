<?php
require_once("conexion.php");
class crud extends Conexion{

  private $pdo;

  public function __construct(
    public string $tabla
  )
  {
    parent::__construct();
    $this->pdo = $this->conexion();
  }

  public function consultarTodo(){
    try{

      $stm = $this->pdo->prepare("SELECT * FROM $this->tabla");
      $stm->execute();
      return $stm->fetchAll(PDO::FETCH_OBJ);

    }catch(PDOException $mensaje){
      echo $mensaje->getMessage();
    }
  }

  public function consultarUno(int $id){
    try{

      $stm = $this->pdo->prepare("SELECT * FROM $this->tabla WHERE id=?");
      $stm->execute([$id]);
      return $stm->fetch(PDO::FETCH_OBJ);
      
    }catch(PDOException $mensaje){
      echo $mensaje->getMessage();
    }
  }

  public function delete(int $id){
    try{

      $stm = $this->pdo->prepare("DELETE FROM $this->tabla WHERE id=?");
      $stm->execute([$id]);
      
    }catch(PDOException $mensaje){
      echo $mensaje->getMessage();
    }
  }

  public function crear(string $columnas,string $marcadores,array $datos){
    $stm = $this->pdo->prepare("INSERT INTO $this->tabla ($columnas) VALUES ($marcadores)");
    $stm->execute($datos);
  }

  public function modificacion(string $columnas,array $datos){
    $stm = $this->pdo->prepare("UPDATE  $this->tabla SET $columnas WHERE id=?");
    $stm->execute($datos);
  }
}



?>