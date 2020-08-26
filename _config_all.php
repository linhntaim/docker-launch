<?php

$variableGit = json_decode(file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'git.json'),true);

shell_exec(sprintf('./docker.git.sh %s %s %s %s', $variableGit['PROJECT_NAME'],$variableGit['GIT_USER_NAME'],$variableGit['GIT_PASSWORD'],$variableGit['GIT_SOURCE']));

//shell_exec(sprintf('./docker.boot.all.sh %s', $variableGit['PROJECT_NAME']));