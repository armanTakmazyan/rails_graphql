# Ruby On Rails Test With Graphql

Necessary commands to start the project:

```sh
$ gem install bundler
$ gem update bundler
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails server
```
Since we are creating an authentication/authorization system from scratch, the following features should be added in the future:
  - Rate Limiting
  - Access Tokens BlackList
  - Refresh Tokens WhiteList (if user will want to log in  and whitelisted.Sesssions.length > 8,
we will reset others 7 tokens and clear whitelistedSessions)
  - Auto destroying feature for Expired Refresh Tokens
  - For more advanced features, maybe we shoud save userIP and user_fingerprint in the refresh_tokens table

License
----

MIT


