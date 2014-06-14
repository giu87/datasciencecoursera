library(httr)

## AUTHORIZATION ##
oauth_endpoints("github")
myapp <- oauth_app("github", "ClientID", "ClientSECRET")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

## SEND REQUEST AND PARSE RESPONSE ##

req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
json <- content(req)

## ANALYZE JSON
d_frame <- jsonlite::fromJSON(toJSON(json))
a$created_at[a$name == "datasharing"]
