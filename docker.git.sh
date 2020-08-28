for i in "$@"; do
    if [[ $i =~ --PROJECT_NAME= ]]; then
        PROJECT_NAME="${i#*=}"
    fi
    if [[ $i =~ --GIT_SOURCE= ]]; then
       GIT_SOURCE="${i#*=}"
    fi
    if [[ $i =~ --GIT_BRANCH= ]]; then
       GIT_BRANCH="${i#*=}"
    fi
done

echo "### PROJECT_NAME=${PROJECT_NAME}"
###echo "### GIT_SOURCE=${GIT_SOURCE}"
echo "### GIT_BRANCH=${GIT_BRANCH}"

##Directory Project
DIR="/dsquare/${PROJECT_NAME}"
if [ -d "$DIR" ]; then
    cd /dsquare/${PROJECT_NAME}
    git checkout ${GIT_BRANCH}
    git pull
    git branch
    echo "### Pull complete"
else
    mkdir /dsquare/${PROJECT_NAME}
    cd /dsquare/${PROJECT_NAME}
    git clone -b ${GIT_BRANCH} ${GIT_SOURCE} .
    git branch
    echo "### Clone complete"
fi

if [ "$(ls -A $DIR)" ]; then
    echo "### Done"
else
    rmdir $DIR
fi