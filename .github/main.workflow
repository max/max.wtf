workflow "build and test" {
  on = "push"
  resolves = ["build & test"]
}

action "build & test" {
  uses = "actions/docker/cli@master"
  args = "build -t max/max.wtf ."
}
