dockerBuild:
	docker build -t xcode-arguments .

dockerBuildNoCache:
	docker build -t xcode-arguments --no-cache .

dockerRunDev:
	docker run -d -p 8080:8080 --name xcode-arguments xcode-arguments

dockerRunProd:
	docker run -d -p 80:80 --name xcode-arguments xcode-arguments