STACK_NAME=sam-app-otel-newrelic-lambda-java17
REGION=<your-region>
PROFILE=<your-profile>
LICENSE_KEY=<your-nr-ingest-license-key>

.PHONY: build

build:
	sam build

deploy: build
	sam deploy \
		--capabilities CAPABILITY_NAMED_IAM \
		--parameter-overrides "NRLicenseKey=${LICENSE_KEY}" \
		--resolve-s3 \
		--stack-name "${STACK_NAME}" \
		--profile "${PROFILE}" \
		--region "${REGION}"

delete:
	sam delete \
		--stack-name "${STACK_NAME}"