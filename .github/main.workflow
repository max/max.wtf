workflow "build and test" {
  on = "push"
  resolves = ["publish"]
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

action "publish" {
  needs = "export"
  uses = "docker://git"
  runs = "git subtree push --prefix dist origin gh-pages"
}
