class kernel_boot_arg::scripts ($path = lookup('kernel_boot_arg_path')) {
    file {
        "${path}/kernel_boot_arg.pl":
            ensure => present,
            owner  => root,
            group  => root,
            mode   => '0755',
            source => 'puppet:///modules/kernel_boot_arg/boot_arg.pl';
        "${path}/kernel_boot_arg_modify.sh":
            ensure  => present,
            require => File["${path}/kernel_boot_arg.pl"],
            owner   => root,
            group   => root,
            mode    => '0755',
            source  => 'puppet:///modules/kernel_boot_arg/boot_arg_modify.sh';
    }
}
