for i in "$@"; do
    if [[ $i =~ --PROJECT_NAME= ]]; then
        PROJECT_NAME="${i#*=}"
    fi
    if [[ $i =~ --GIT_URL= ]]; then
       GIT_URL="${i#*=}"
    fi
done

echo "### PROJECT_NAME=${PROJECT_NAME}"
echo "### PROJECT_NAME=${GIT_URL}"
##Directory Project
DIR="/dsquare/${PROJECT_NAME}"
if [ -d "$DIR" ]; then
cd /dsquare/${PROJECT_NAME}
git pull
echo "Done"
else
mkdir /dsquare/${PROJECT_NAME}
cd /dsquare/${PROJECT_NAME}
git clone ${GIT_URL} .
echo "Done"
fi