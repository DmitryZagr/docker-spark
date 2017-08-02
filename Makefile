build-local:
	docker build -t bde2020/spark-base:2.2.0-hadoop2.8.1-java8 ./base
	docker build -t bde2020/spark-master:2.2.0-hadoop2.8.1-java8 ./master
	docker build -t bde2020/spark-worker:2.2.0-hadoop2.8.1-java8 ./worker
