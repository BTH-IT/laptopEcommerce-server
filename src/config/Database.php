<?php

class Database
{
  public $connect;
  protected $severname = "localhost";
  protected $username = "root";
  protected $password = "";
  protected $dbname = "ecommerce";

  function __construct()
  {
    $this->connect = mysqli_connect($this->severname, $this->username, $this->password);
    mysqli_select_db($this->connect, $this->dbname);
    mysqli_query($this->connect, "SET NAMES 'utf8'");
  }
}
