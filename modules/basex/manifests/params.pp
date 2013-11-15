# basex module
# params.pp
# Copyright Francisco Huertas, Center for Open Middleware, Universidad Politecnica de Madrid


class basex::params  {

  $array_token           = hiera('array_token')
  $max_tries             = hiera('max_tries')
  $try_sleep             = hiera('try_sleep')
  $persistent_dir        = hiera('persistent_dir')


  $user                   = hiera('user')
  $password               = hiera('password')
  $oldpassword            = hiera('oldpassword')
  $basex_path             = hiera('basex_path')
  $basex_rest_url         = hiera('basex_rest_url')
  $java_home              = hiera('java_home')
  $tmp_dir                = hiera('tmp_dir')
  $httplocal              = hiera('HTTPLOCAL')
  $restxqpath             = hiera('RESTXQPATH')
  $catalina_home          = hiera('catalina_home')
  # Arrays: 
  $dbs                    = hiera_array('dbs').join("$array_token")
  $files                  = hiera_array('files').join("$array_token")

}
