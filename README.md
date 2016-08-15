vagrant_oracle_database_12.1.0.2_EE_on_Linux
============================================

Configuration files to create a VirtualBox image with Oracle Database 12.1.0.2 on CentOS 6.5 Linux 64 bit using nothing more than Vagrant and the two database installation files

Create a directory _software_ and download linuxamd64_12102_database_1of2.zip and linuxamd64_12102_database_2of2.zip from OTN (http://www.oracle.com/technetwork/database/enterprise-edition/downloads/database12c-linux-download-2240591.html)

The VM that is created uses 10.10.10.9 as its IP address.

The passwords for sys and system are oracle.

The OS users root and  vagrant have vagrant as password. User oracle has oracle as password.

The Database SID is db12102:

The jdbc url is `jdbc:oracle:thin:@10.10.10.9:1521:db12102`

All configuration is done in just a few files:

```
Vagrantfile
puppet\hieradata\common.yaml
puppet\hieradata\db12c.example.com.yaml
puppet\manifests\db.pp
```

All other files are reused Puppet modules - largely supplied by Edwin.
Note: These configuration files are based on the work done by Edwin Biemond and use his Oradb Puppet Module (see https://github.com/biemond/biemond-oradb)
