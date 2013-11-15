# Java JRE Installation module

## Overview 

Author: Francisco Huertas Ferrer <francisco.huertas@centeropenmiddleware.com>

Center: Center for Open Middleware, Universidad Politecnica de Madrid

License: Apache 2.0

Version: 0.0.1

Supported OS: Linux family

## Module description


## Support to new OS families

## Module information

### puppet directories: 

    Puppet_base_dir
    | - hieradata # It stores the yaml files. It must be configured in hiera.yaml and can be different
    | - module # Module folder
    |   | - files # It stores the files, the jre package must be in this directory
    |   | - manifest # It stores the manifest, 
    |   | - templates # It stores the templates. The scripts are in this directory


### Requisites 

* Puppet core version: >= 3.2.X
* OS Family supported: Debian (Ubuntu is supported too)
* Install and configure hiera.  Installation [guide](http://docs.puppetlabs.com/hiera/1/installing.html)

### Installation: 

* Copy the module directory in the modules folder. 

### Setup

* Includes in the manifest the module definition ``include basex`` or ``class { 'basex' : }``
* Create and fill the data files: the hierarchy are defined in the heira.yaml in the puppet directory.
* Put the basex package in the file folder. It should be in tar format

### Variables description


