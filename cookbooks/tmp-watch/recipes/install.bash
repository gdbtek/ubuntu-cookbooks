#!/bin/bash -e

function install()
{
    umask '0022'

    if [[ "$(isCentOSDistributor)" = 'true' || "$(isRedHatDistributor)" = 'true' ]]
    then
        # Install

        installPackages 'tmpwatch'

        # Config Cron

        local content=''
        local i=0

        for ((i = 0; i < ${#TMP_WATCH_FOLDERS[@]}; i = i + 3))
        do
            content="${content}\ntmpwatch -a -f -u -v -x '${TMP_WATCH_FOLDERS[${i} + 1]}' '${TMP_WATCH_FOLDERS[${i} + 2]}' '${TMP_WATCH_FOLDERS[${i}]}'"
        done

        echo -e "$(removeEmptyLines "${content}")" > "${TMP_WATCH_CRON_FOLDER}/tmp-watch"
        chmod 755 "${TMP_WATCH_CRON_FOLDER}/tmp-watch"
        rm -f "${TMP_WATCH_CRON_FOLDER}/.placeholder"
    else
        fatal 'FATAL : only support CentOS or RedHat OS'
    fi

    umask '0077'
}

function main()
{
    local -r appFolderPath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    source "${appFolderPath}/../../../libraries/util.bash"
    source "${appFolderPath}/../attributes/default.bash"

    checkRequireLinuxSystem
    checkRequireRootUser

    header 'INSTALLING TMP-WATCH'

    install
    installCleanUp
}

main "${@}"