<?php
$projectName = $argv[1];

file_put_contents(
    __DIR__ . DIRECTORY_SEPARATOR . '.nginx.config',
    str_replace(
        '{project_name}', 
        $projectName,
        file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'nginx.config')
    )
);

file_put_contents(
    __DIR__ . DIRECTORY_SEPARATOR . '.supervisor.config',
    str_replace(
        '{project_name}', 
        $projectName,
        file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'supervisor.config')
    )
);
