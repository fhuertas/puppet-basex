# Basex deploy module into a Tomcat 

## Overview 

Author: Francisco Huertas Ferrer <francisco.huertas@centeropenmiddleware.com>

Center: Center for Open Middleware, Universidad Politecnica de Madrid

License: Apache 2.0

Version: 0.0.1

Supported OS: Linux family

## Module description

This module deploys, configures and fill a basex db. The application container should be Tomcat (it is not tested in others containers)

## Module information

### puppet directories: 

    Puppet_base_dir
    | - hieradata # It stores the yaml files. It must be configured in hiera.yaml and can be different
    | - module # Module folder
    |   | - files # It stores the files, the jre package must be in this directory
    |   | - manifest # It stores the manifest, 
    |   | - templates # It stores the templates. The scripts are in this directory


### Requisites 

* Puppet core version: >= 3.X
* OS Family supported: Linux
* hiera.  Installation [guide](http://docs.puppetlabs.com/hiera/1/installing.html)

### Installation: 

* Copy the module directory in the modules folder. 

### Setup

* Create and fill the data files: the hierarchy are defined in the heira.yaml in the puppet directory.
* Put the basex package in the file folder. It should be in tar format
* To deploy and configure add one of  these sentences ``include basex`` or ``class { 'basex' : }`` in the manifest 
* To fill the data add one of these sentences ``include basex::configure_db`` or ``class { 'basex::configure_db' : }`` in the manifest. If the basex is not deployed, this sentence should have a require with the deploy of db

### Variables description

A sample of variables ca be seen in the files contained in the ``hieradata`` directory and the ``common.yaml`` file has the variable descriptions

* *max_tries*: time to try execute the some operations (20 s = 10 tries * 2 sec)
* *try_sleep*: time to try execute the some operations (20 s = 10 tries * 2 sec)
* *user*: user
* *password*: password
* *oldpassword*: old password for the system, if the old and new password are diferent the basex password will be changed
* *basex_path*: application path
* *basex_rest_url*: url of the basex rest services
* *databases*: A list of databases to be created the format of this elemtns are: 
     * *db1*: The tag of he first database, the name is irrelevant 
         * *db_version*: The version of the database, if the version is diferent that the last of the database, this is changed
         * *name*: # The name of the database
         * *files*: # List of files to store in the database. The format of the files are the next
             * *'file1.xml'*: The file in the origin and destination has the same name
             * *'file2_name_origin.xml':'file2_name_destination.xml'* # The file in the origin and destionation has not the same name
     * *db2*:
* *java_home*: Java installation path
* *catalina_home*:  tomcat base installation
* *tmp_dir*: path of a tmp file
* *persistent_directory*: Persistent directory where the dates can be saved

