# Grabs a specific header from a request and outputs it to a file
#
#
define wget::head(
    $destination    = '',
    $source         = $name,
    $header         = '',
) {

    if $::kernel == 'windows' {

        $cmd = "for /f \"tokens=2\" %a in ('wget -S --spider --no-check-certificate ${source} ^2^>^&^1 ^| findstr ${header}') do echo %a > ${destination}"

        exec { "wget-${name}":
            command => $cmd,
            path    => $::path,
            require => Class['wget'],
        }

    }

}