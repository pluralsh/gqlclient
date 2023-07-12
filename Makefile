generate-in-container: ## resync client with current graph endpoint
	hack/gen-api-client.sh

generate:
	go run github.com/Yamashou/gqlgenc