network:
	docker network create spark-net

spark:
	docker-compose -f docker-compose-minimal.yml up -d

down:
	docker-compose -f docker-compose-minimal.yml down
	docker-compose -f docker-compose-spark-app.yml down
	docker network rm spark-net

spark-app:
	docker-compose -f docker-compose-spark-app.yml build
	docker-compose -f docker-compose-spark-app.yml up

build:
	docker build -t bde2020/spark-base:2.1.1-hadoop2.8.1-hive-java8 ./base
	docker build -t bde2020/spark-master:2.1.1-hadoop2.8.1-hive-java8 ./master
	docker build -t bde2020/spark-worker:2.1.1-hadoop2.8.1-hive-java8 ./worker
