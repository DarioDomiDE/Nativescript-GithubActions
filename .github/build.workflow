workflow "New workflow" {
  on = "push"
  resolves = [
    "install angular cpi",
    "appleboy/scp-action@master",
  ]
}

action "GitHub Action for npm i" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  runs = "npm i"
}

action "install angular cpi" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  runs = "npm install @angular/cli"
}

action "appleboy/scp-action@master" {
  uses = "appleboy/scp-action@master"
  needs = ["GitHub Action for npm i", "install angular cpi"]
}
