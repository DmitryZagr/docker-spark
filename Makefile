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
	docker build -t dmitryzagr/spark-base:2.3.0-hadoop3.0.0-java8 ./base
	docker build -t dmitryzagr/spark-master:2.3.0-hadoop3.0.0-java8 ./master
	docker build -t dmitryzagr/spark-worker:2.3.0-hadoop3.0.0-java8 ./worker
push:
	docker push dmitryzagr/spark-base:2.3.0-hadoop3.0.0-java8
	docker push dmitryzagr/spark-master:2.3.0-hadoop3.0.0-java8
	docker push dmitryzagr/spark-worker:2.3.0-hadoop3.0.0-java8