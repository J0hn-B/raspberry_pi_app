# Use Github Actions to test Kubernetes configuration and deployments

![Test with K3s](https://github.com/J0hn-B/raspberry_pi_app/workflows/Test%20with%20K3s/badge.svg)

Deploy the app in a k3s cluster for testing.
Use nektos/act to develop the Github Actions localy and deploy in Github.
The actions are developed with bash scripts, avoiding vendor lockdown and allow moving them between defirent ci/cd tools.

Act for local github actions development
<https://github.com/nektos/act>
Command act -r will keep the act container up and running instead of exit at the end of the "push"
