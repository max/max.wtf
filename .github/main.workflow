workflow "build & test" {
  on = "push"
  resolves = ["publish"]
}

action "build" {
  uses = "docker://docker"
  runs = ["sh", "-c", "docker build -t gcr.io/meta-verse/$GITHUB_REPOSITORY:$GITHUB_SHA ."]
}

action "auth google cloud" {
  uses = "actions/gcloud/auth@master"
  secrets = ["GCLOUD_AUTH"]
}

action "publish" {
  needs = ["auth google cloud", "build"]
  uses = "actions/gcloud/cli@master"
  runs = ["sh", "-c", "gcloud docker -- push gcr.io/meta-verse/$GITHUB_REPOSITORY:$GITHUB_SHA"]
}
