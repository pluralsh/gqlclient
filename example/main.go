package main

import (
	"context"
	"fmt"
	"net/http"
	"os"

	"github.com/Khan/genqlient/graphql"
	"github.com/pluralsh/gqlclient"
)

type authedTransport struct {
	key     string
	wrapped http.RoundTripper
}

func (t *authedTransport) RoundTrip(req *http.Request) (*http.Response, error) {
	req.Header.Set("Authorization", "Bearer "+t.key)
	return t.wrapped.RoundTrip(req)
}

func main() {
	var err error
	defer func() {
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	}()

	key := "PASTE YOUR KEY HERE FROM https://app.plural.sh/profile/tokens"

	httpClient := http.Client{
		Transport: &authedTransport{
			key:     key,
			wrapped: http.DefaultTransport,
		},
	}
	graphqlClient := graphql.NewClient("https://app.plural.sh/gql", &httpClient)

	var viewerResp *gqlclient.MeResponse
	viewerResp, err = gqlclient.Me(context.Background(), graphqlClient)
	if err != nil {
		return
	}
	fmt.Println("you are", viewerResp.Me)

}
