workflow "build and test" {
  on = "push"
  resolves = ["build & test"]
}

action "install" {
  uses = "actions/npm@master"
  args = "install"
}

action "test" {
  uses = "actions/npm@master"
  args = "test"
}

action "build" {
  uses = "actions/npm@master"
  args = "run build"
}

action "export" {
  uses = "actions/npm@master"
  args = "run export -- -o /github/workspace/dist"
}

action "list" {
  uses = "docker://alpine"
  runs = "ls /github/workspace/dist"
}
