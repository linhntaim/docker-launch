<?php

$variableGit = json_decode(file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'git.json'),true);

$variableGit['GIT_SOURCE'] = sprintf('http://%s:%s@git-gbu.japaneast.cloudapp.azure.com/gbu/%s',$variableGit['GIT_USERNAME'],$variableGit['GIT_PASSWORD'],$variableGit['PROJECT_NAME']);

$variableGit['PROJECT_NAME'] = str_replace('-','_',$variableGit['PROJECT_NAME']);

$runGit = shell_exec(sprintf('bash /docker/docker.git.sh --PROJECT_NAME=%s --GIT_SOURCE=%s --GIT_BRANCH=%s', $variableGit['PROJECT_NAME'],$variableGit['GIT_SOURCE'],$variableGit['GIT_BRANCH']));

echo $runGit;

$webConfig = shell_exec(sprintf('php /docker/docker.setting.php "%s" ', $variableGit['PROJECT_NAME']));

echo $webConfig;

$boot = shell_exec(sprintf('bash /docker/docker.boot.sh --PROJECT_NAME=%s --RESOURCE_DATABASE=%s --RESOURCE_ENV_API=%s', $variableGit['PROJECT_NAME'],$variableGit['RESOURCE_DATABASE'],$variableGit['RESOURCE_ENV_API']));

echo $boot;
