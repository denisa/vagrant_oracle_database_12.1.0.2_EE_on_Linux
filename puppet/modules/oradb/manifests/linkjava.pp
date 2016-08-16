# == Class: oradb::linkjava
#
#
#
#
#
define oradb::linkjava(
  $oracleBase  = undef,
  $oracleHome   = undef,
  $javaVersion  = undef,
  $user         = 'oracle',
  $group        = 'dba',
){
  $javavm  = "${oracleHome}/javavm"
  $logfile = "${javavm}/admin/version.log"

  exec { "Set to java ${javaVersion}":
    command        => "/usr/bin/perl ${javavm}/install/update_javavm_binaries.pl ${javaVersion}",
    user           => $user,
    group          => $group,
    logoutput      => true,
    unless         => "/bin/grep -q ${javaVersion} $logfile", # unless log file exists and contains desired version
  }

  exec { "Re-link oracle":
    cwd            => "${oracleHome}/rdbms/lib",
    command        => "/usr/bin/make -f ins_rdbms.mk ioracle",
    environment    => ["ORACLE_HOME=${oracleHome}", "ORACLE_BASE=${oracleBase}", "LD_LIBRARY_PATH=${oracleHome}/lib"],
    user           => $user,
    group          => $group,
    require        => Exec["Set to java ${javaVersion}"],
    logoutput      => true,
  }
}
