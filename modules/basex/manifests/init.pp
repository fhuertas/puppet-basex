define basex::mkdir ($dir, $owner = "root", $group ="root") {
  $in_tmp_dir         = "${tomcat7::params::tmp_dir}"
  file { "${in_tmp_dir}/${module_name}-${title}.sh" :
    mode     => 744,
    owner    => "$owner",
    group    => "$group",
    content  => template("${module_name}/mkdir-${::osfamily}.sh.erb") ,
  }
  exec { "${in_tmp_dir}/${module_name}-${title}.sh":
    cwd     => "${in_tmp_dir}",
    require => File["${in_tmp_dir}/${module_name}-${title}.sh"],
  }
}


class basex () {

  include basex::configure
#  include basex::configure_db
#  include basex::params
#  create_resources(dbs_definition, hiera('databases'))
#  foreach (hiera('files')) | $server | {
#    notify { "$server" : }
#  }
  #notify { "$tt-" : }

}
