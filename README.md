[![Build Status](https://travis-ci.org/dylan/kb_trimmomatic.svg?branch=master)](https://travis-ci.org/dylan/kb_trimmomatic)

# kb_trimmomatic
---

## Github Actions
1. Add .github/workflows/action.yaml file to the repo

   1. Base: https://github.com/kbaseapps/kb_sdk_actions/blob/master/action.yaml
   2. Dakota’s in kb_djornl: with crontab preset, https://github.com/kbaseapps/kb_djornl/blob/main/.github/workflows/action.yaml 

2. Add secrets
   1. Go to settings —> Secrets and Variables —> Actions
   2. Click “New Repository Secret”
   3. The name should be whatever name it’s given in the action.yaml file; the value should be the dev token for whatever environment (appdev, narrative, ci) is used by the tests
   4. Now the token is in the repository settings. That will allow GHA to run your token without exposing it.
      
> Secrets and variables allow you to manage reusable configuration data. Secrets are **encrypted** and are used for sensitive data. [Learn more about encrypted secrets](https://docs.github.com/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets).
> Variables are shown as plain text and are used for **non-sensitive** data. [Learn more about variables](https://docs.github.com/actions/learn-github-actions/variables).

> Anyone with collaborator access to this repository can use these secrets and variables for actions. They are not passed to workflows that are triggered by a pull request from a fork.


3. Run actions
   1. Go to the actions tab in the repo
   2. Look for the appropriate **name** in the sidebar (i.e., line #1 of **action.yaml** , which is “KBase SDK Tests” in the example)
   3. Click the “run workflow” dropdown and select the branch to run from. Note: the branch set as default in the repo must have the tests added to do this, then you can run it from any branch.