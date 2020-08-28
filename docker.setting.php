<?php
$projectName = $argv[1];

file_put_contents(
    __DIR__ . DIRECTORY_SEPARATOR . '.nginx.conf',
    str_replace(
        '{project_name}', 
        $projectName,
        file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'nginx.conf')
    )
);

file_put_contents(
    __DIR__ . DIRECTORY_SEPARATOR . '.supervisor.conf',
    str_replace(
        '{project_name}', 
        $projectName,
        file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'supervisor.conf')
    )
);

echo "### Done config webserver";
