workflow "New workflow" {
  on = "push"
  resolves = [
    "Copy file",
    "npm i",
    "install angular cli",
  ]
}

action "npm i" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  runs = "npm i"
}

action "install angular cli" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  runs = "npm install @angular/cli"
}

action "Copy file" {
  uses = "appleboy/scp-action@master"
  needs = [
    "install angular cli",
    "npm i",
  ]
  env = {
    HOST = "example.com"
    USERNAME = "foo"
    PORT = "22"
    SOURCE = "README.md"
    TARGET = "/home/actions/test"
  }
  secrets = [
    "HOST",
    "USERNAME",
    "PASSWORD",
  ]
}
