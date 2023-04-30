<?php

require __DIR__ . '../../../vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

function decodeToken()
{
  $allHeaders = getallheaders();
  if (!isset($allHeaders["Authorization"])) return false;
  $bearerJWT = $allHeaders["Authorization"];
  $secret_key = 'laptop ecommerce';
  $jwt = explode(" ", $bearerJWT)[1];

  if ($jwt == 'undefined' || $jwt == 'null') return false;
  $decoded = JWT::decode($jwt, new Key($secret_key, 'HS256'));
  $data = (array) $decoded;
  $data["data"] = (array) $data["data"];

  $expired = checkExpireToken($data["exp"]);

  if ($expired) {
    return false;
  }

  return $data;
}

function checkExpireToken($expireTime)
{
  $expire = date("Y-m-d H:i:s", $expireTime);

  return $expire < time();
}
