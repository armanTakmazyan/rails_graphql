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
  - We should make authentication/authorization with refresh tokens. We should not use only access token. 
  - We should replace the old access token on every request with the new one.
  - Rate Limiting
  - Access Tokens BlackList (For LogOut or Blocked Users)
  - Refresh Tokens WhiteList (if user will want to log in  and whitelisted.Sesssions.length > 8,
we will reset others 7 tokens and clear whitelistedSessions)
  - Auto destroying feature for Expired Refresh Tokens (Or For LogOut or Blocked Users)
  - For more advanced features, maybe we shoud save userIP and user_fingerprint in the refresh_tokens table
  - And we must use another package for dealing with jwt :)

  
License
----

MIT


