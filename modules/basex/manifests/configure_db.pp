# basex, puppet
# agent1.puppet.l3p1.centeropenmiddleware.com.yaml.pp
# Copyright Francisco Huertas, Center for Open Middleware, Universidad Politecnica de Madrid


class basex::configure_db ()  {
  include basex::params
  define dbs_definition($db_version, $name, $files) {
    $user             = "${basex::params::user}" 
    $password         = "${basex::params::password}"
    $basex_rest_url   = "${basex::params::basex_rest_url}"
    $persistent_dir   = "${basex::params::persistent_dir}"
    $databases        = "${basex::params::dbs}"
    $tmp_dir          = "${basex::params::tmp_dir}"
    $mytmp            = "${tmp_dir}/${module_name}"
    file { "db_${name}.ver" :
      ensure    => file,  
      content   => "$db_version",
      path      => "${persistent_dir}/db_${name}.ver",
    }
    each ($files ) |$file| {
      $file_o = $file.split(":")[0]
#      notify {"$file_o" : }
      file { "${file_o}" : 
        ensure     => file, 
        path       => "${mytmp}/${file_o}", 
#        subscribe  => File["db_${name}.ver"], 
        source    => "puppet:///modules/basex/${file_o}",
        owner     => "root", 
        group     => "root",  
      }
    }
    exec { "run-${name}" : 
      command     => "${persistent_dir}/db-${name}.sh", 
      cwd         => "$mytmp",
      subscribe   => File["db_${name}.ver"],  
      refreshonly => true, 
    }
    
#    notify {"${name} - copiados" : 
#      require => File [$files],
#      subscribe =>  File["db_${name}.ver"],
#      refreshonly => true , 
#    }
    $joined_files = join ($files, " ")
    file {"script-db-${name}":
      ensure   => file,
      path     => "${persistent_dir}/db-${name}.sh",
      owner    => "root",
      group    => "root",
      content  => template("${module_name}/createDB.sh.erb"),
      mode     => "744", 
    }
    
#    exec { "run-${name}" : 
#      command   => "${persistent_dir}/db-${name}.sh", 
#      cwd       => 
#    }


#    notify { "$name - $joined_files" : }
#    foreach ($files) |$file| {
#      notify { "${user} DB: $name, file $file, $gg": }
#    }
  }


  $user             = "${basex::params::user}" 
  $password         = "${basex::params::password}"
  $basex_rest_url   = "${basex::params::basex_rest_url}"
  $persistent_dir   = "${basex::params::persistent_dir}"
  $databases        = "${basex::params::dbs}"
  create_resources(dbs_definition, hiera('databases'))  

    file { "pp.xml" : 
      ensure     => file, 
      path       => "/tmp/prueba.xml", 
#      source    => "puppet:///module/basex/AppLogsService.xml", 
    }

}
