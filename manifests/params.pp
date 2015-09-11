class mig::params {

    case $::osfamily {
        'redhat': {
            $ext        = "rpm"
            $prod       = "prod-1."
            $silly      = "-"
            $provider   = "rpm"
        }
        'debian': {
            $ext        = "deb"
            $prod       = "prod_"
            $silly      = "_"
            $provider   = "dpkg"
        }
        default: {
            fail("Unsupported OS Family: ${::osfamily}.")
        }
    }

}
