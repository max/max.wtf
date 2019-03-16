workflow "build & test" {
  on = "push"
  resolves = ["test"]
}

action "build" {
  uses = "docker://docker"
  runs = ["sh", "-c", "docker build -t $GITHUB_REPOSITORY ."]
}
