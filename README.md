# github-release-drone

[![Build Status](https://drone.devpie.io/api/badges/devpies/github-release-drone/status.svg)](https://drone.devpie.io/devpies/github-release-drone)

Drone plugin for making semantic releases based on https://github.com/semantic-release/semantic-release.

## Usage

[Generate a Github personal access token.](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line)

Then create a `github_token` secret per repository using the drone web ui.

```
# .drone.yml

kind: pipeline
name: example

steps:
  - name: semantic-release
    image: devpies/github-release-drone:1.0.0
    environment:
      GITHUB_TOKEN:
        from_secret: github_token

trigger:
  branch:
    - master
  event:
    - push
```

Don't forget to enforce commit message conventions. Use [commitizen.](https://github.com/commitizen/cz-cli)

![commitizen usage](https://raw.githubusercontent.com/commitizen/cz-cli/master/meta/screenshots/add-commit.png)
