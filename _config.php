<?php

$variableGit = json_decode(file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'git.json'),true);

$variableGit['PROJECT_NAME'] = str_replace('-','_',$variableGit['PROJECT_NAME']);

$variableGit['GIT_SOURCE'] = sprintf('http://%s:%s@%s',$variableGit['GIT_USER_NAME'],$variableGit['GIT_PASSWORD'],$variableGit['GIT_URL']);

$runGit = shell_exec(sprintf('bash /dsquare/docker/docker.git.sh --PROJECT_NAME=%s --GIT_SOURCE=%s --GIT_BRANCH=%s', $variableGit['PROJECT_NAME'],$variableGit['GIT_SOURCE'],$variableGit['GIT_BRANCH']));

echo $runGit;

$webConfig = shell_exec(sprintf('php /dsquare/docker/_web_config.php "%s" ', $variableGit['PROJECT_NAME']));

echo $webConfig;

$boot = shell_exec(sprintf('bash /dsquare/docker/docker.boot.sh %s', $variableGit['PROJECT_NAME']));

echo $boot;
