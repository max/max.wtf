workflow "build & test" {
  resolves = ["publish"]
  on = "check_suite"
}

action "build" {
  uses = "docker://docker"
  runs = ["sh", "-c", "docker build -t gcr.io/$GCP_PROJECT/$GITHUB_REPOSITORY:$GITHUB_SHA ."]
  secrets = ["GCP_PROJECT"]
}

action "auth gcloud" {
  uses = "actions/gcloud/auth@master"
  secrets = ["GCLOUD_AUTH"]
}

action "publish" {
  needs = ["auth gcloud", "build"]
  uses = "actions/gcloud/cli@master"
  runs = ["sh", "-c", "gcloud docker -- push gcr.io/$GCP_PROJECT/$GITHUB_REPOSITORY:$GITHUB_SHA"]
  secrets = ["GCP_PROJECT"]
}
