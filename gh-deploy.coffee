module.exports = (name, username, password) ->
  GithubApi = require 'github'

  github = new GithubApi
    version: '3.0.0'
    headers:
      'user-agent': 'gh-uploader'

  content = 'Hello world'

  toBase64 = (string) -> (new Buffer string).toString 'base64'
  errorToMessage = (error) -> JSON.parse(error.message).message
  isMainGithubIo = -> return name is "#{username}.github.io"
  repoUrl = -> "http://#{username}.github.io/#{if isMainGithubIo() then '' else name}"

  github.authenticate
    type: 'basic'
    username: username
    password: password

  github.repos.get
    user: username
    repo: name
  , (err,res) ->
    if res
      console.log "ERROR: Repository #{name} already exists. Pick a different reponame"
    else
      github.repos.create
        name: name
      , (err, res) ->
        if err
          console.log "ERROR: Error creating repository: #{errorToMessage err}"
        else
          github.repos.createFile
            user: username
            repo: name
            branch: if isMainGithubIo() then 'master' else 'gh-pages'
            path: 'index.html'
            message: 'Add index.html'
            content: toBase64 content
          , (err, res) ->
              if err
                console.log "ERROR: Error creating file: #{errorToMessage err}"
              else
                console.log "INFO: Page created. You might need to refresh the page"
                require('opn') repoUrl()
