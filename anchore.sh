echo "starting....."
docker-compose up -d
docker-compose ps
export PATH="$PATH:/root/.local/bin"
echo $PATH
python -m site --user-base
docker-compose exec engine-api system status
docker-compose exec engine-api anchore-cli system status
docker-compose exec engine-api anchore-cli system feeds list
pip install --user --upgrade anchorecli
anchore-cli --version
#anchore-cli image list
#anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image add openjdk:11-jdk
#anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image vuln openjdk:11-jdk all
#anchore-cli --u admin --p foobar --url http://localhost:8228/v1 registry add registry_uri access_key secret_key --registry-type=awsecr
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 registry add 828047571549.dkr.ecr.us-east-2.amazonaws.com/ecr-repo-sample AKIA4BS33HJOV3EIIOO7 1EH49VfVT+wPuTVeGZy6HsTFIq+hTO3L9w77ooi1 --registry-type=awsecr
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image add 828047571549.dkr.ecr.us-east-2.amazonaws.com/ecr-repo-sample:latest
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image vuln 828047571549.dkr.ecr.us-east-2.amazonaws.com/ecr-repo-sample:latest all
sleep 15s
anchore-cli --u admin --p foobar --url http://localhost:8228/v1 image vuln 828047571549.dkr.ecr.us-east-2.amazonaws.com/ecr-repo-sample:latest all
