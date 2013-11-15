class basex::configure  {
  # Import parameters
  include basex::params
  $user             = "${basex::params::user}" 
  $password         = "${basex::params::password}"
  $oldpassword      = "${basex::params::oldpassword}"
  $basex_path       = "${basex::params::basex_path}"
  $basex_rest_url   = "${basex::params::basex_rest_url}"
  $databases        = "${basex::params::dbs}"
  $files            = "${basex::params::files}"
  $java_home        = "${basex::params::java_home}"
  $tmp_dir          = "${basex::params::tmp_dir}"
  $httplocal        = "${basex::params::httplocal}"
  $restxqpath       = "${basex::params::restxqpath}"
  $catalina_home    = "${basex::params::catalina_home}"
  $max_tries        = "${basex::params::max_tries}" 
  $try_sleep        = "${basex::params::try_sleep}" 
  $persistent_dir   = "${basex::params::persistent_dir}" 
  $mytmp = "${tmp_dir}/${module_name}"
  # Copy configuretion file (web.xml)
  #   notify {"$basex_path-" : }
  file { "$mytmp" : 
    ensure   => directory,
  }
  file {'web.xml': 
    ensure   => file, 
    path     => "${mytmp}/web.xml", 
    owner    => "root",
    group    => "root", 
    content  => template("${module_name}/web.xml.erb"), 
    require  => File["$mytmp"]
  }  
  file {'config-files-script' :
    path      => "${mytmp}/config.sh", 
    ensure    => file, 
    owner     => "root", 
    group     => "root", 
    mode      => 755, 
    content   => template("${module_name}/config.sh.erb"), 
    require  => File["$mytmp"]
  }
  exec { "${mytmp}/config.sh" :
    cwd          => "${mytmp}",
    tries        => "$max_tries", 
    try_sleep    => "$try_sleep",
    user         => "root",  
    group        => "root",  
    require      => File['config-files-script'], 
  }
}
