workflow "check" {
  on = "push"
  resolves = ["test"]
}

action "test" {
  uses = "docker://docker"
  args = ["build", "-t", "max/max.wtf", "."]
}

workflow "publish" {
  on = "push"
  resolves = ["deploy"]
}

action "filter" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "build" {
  needs = ["filter"]
  uses = "docker://docker"
  args = ["build", "-t", "max/max.wtf", "."]
}

action "extract" {
  needs = ["build"]
  uses = "./.github/extract"
}

action "deploy" {
  needs = ["extract"]
  uses = "./.github/deploy"
}
