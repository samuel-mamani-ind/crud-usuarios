<?php
require_once("modelo/usuario.php");

class UsuarioControlador extends Usuario{

  public function __construct()
  {
    parent::__construct();
  }

  public function indexUsuario(){
    require_once("vista/usuarios.php");
  }

  public function mostrarUsuario(){
    if(isset($_REQUEST["id"])){
      $usuario = $this->consultarUno($_REQUEST["id"]);
    }else{
      $usuario = $this;
    }
    require_once("vista/usuario_formulario.php");
  }

  public function guardar(){
    $this->id = $_REQUEST["id"];
    $this->nombre = $_REQUEST["nombre"];
    $this->apellido = $_REQUEST["apellido"];
    $this->telefono = $_REQUEST["telefono"];
    $this->edad = $_REQUEST["edad"];
    $this->id>0?$this->actualiar():$this->insertar();

    header("Location:index.php");
  }

  public function eliminar(){
    $this->delete($_REQUEST["id"]);
    
    header("Location:index.php");
  }
}


?>