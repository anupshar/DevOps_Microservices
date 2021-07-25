setup:
	python3 -m venv .udacity-devops

install:
	. .udacity-devops/bin/activate && pip install --upgrade pip &&\
		. .udacity-devops/bin/activate && pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	. .udacity-devops/bin/activate && circleci config process .circleci/config.yml

run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	. .udacity-devops/bin/activate && circleci local execute

lint:
	./hadolint demos/flask-sklearn/Dockerfile
	. .udacity-devops/bin/activate && pylint --disable=R,C,W1203 demos/**/**.py

all: setup install lint test
