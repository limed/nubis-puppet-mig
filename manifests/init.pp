
class mig (
    $version
) {
    require mig::params

    $url = "https://s3.amazonaws.com/mig-packages/mig-agent-nubis${mig::params::silly}${version}.${mig::params::prod}${::architecture}.${mig::params::ext}"

    notice ("Grabbing from ${url}")

    wget::fetch { "download MIG ${version}":
        source      => $url,
        destination => "/tmp/mig.${mig::params::ext}",
        verbose     => true,
        redownload  => true, # The file already exists, we replace it
    }

    # TODO: instead of grabing the RPM or deb url
    #       it should be hosted in an actual repo instead
    package { 'mig':
        ensure   => present,
        source   => "/tmp/mig.${mig::params::ext}",
        provider => $mig::params::provider,
        require  => Wget::Fetch["download MIG $version"]
    }

}
