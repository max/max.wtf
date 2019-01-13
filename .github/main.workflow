workflow "build and test" {
  on = "push"
  resolves = ["list"]
}

action "install" {
  uses = "actions/npm@master"
  args = "install"
}

action "test" {
  needs = "install"
  uses = "actions/npm@master"
  args = "test"
}

action "build" {
  needs = "test"
  uses = "actions/npm@master"
  args = "run build"
}

action "export" {
  needs = "build"
  uses = "actions/npm@master"
  args = "run export -- -o /github/workspace/dist"
}

action "list" {
  needs = "export"
  uses = "docker://alpine"
  runs = "ls /github/workspace/dist"
}
