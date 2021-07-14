all: fmt flake8 mypy coverage

fmt:
	poetry run isort .
	poetry run black .

flake8:
	poetry run flake8 .

mypy:
	poetry run mypy --ignore-missing-imports --follow-imports=silent --show-column-numbers CHANGEME

test:
	poetry run coverage run --source CHANGEME -m pytest

coverage: test
	poetry run coverage report

htmlcov: test
	poetry run coverage html
	open htmlcov/index.html

.PHONY: fmt flake8 mypy test coverage htmlcov all 
