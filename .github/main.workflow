workflow "build & test" {
  on = "push"
  resolves = ["build"]
}

action "build" {
  uses = "docker://docker"
  runs = ["sh", "-c", "docker build -t $GITHUB_REPOSITORY ."]
}
