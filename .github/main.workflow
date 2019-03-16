workflow "check" {
  on = "push"
  resolves = ["test"]
}

action "test" {
  uses = "docker://alpine"
  args = ["printenv"]
}
