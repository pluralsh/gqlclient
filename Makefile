generate-in-container: ## resync client with current graph endpoint
	hack/gen-api-client.sh

generate:
	curl -L https://github.com/pluralsh/plural/raw/master/schema/schema.graphql --output schema/schema.graphql
	go run github.com/Yamashou/gqlgenc
