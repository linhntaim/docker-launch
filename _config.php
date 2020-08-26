<?php

$variableGit = json_decode(file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'git.json'),true);

$output = shell_exec(sprintf('bash /dsquare/docker/docker.git.sh --PROJECT_NAME=%s --GIT_URL=%s', $variableGit['PROJECT_NAME'],$variableGit['GIT_URL']));

echo $output;

//shell_exec(sprintf('./docker.boot.sh %s', $variableGit['PROJECT_NAME']));