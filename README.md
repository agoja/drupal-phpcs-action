# PHP CodeSniffer GitHub Action

This action will help you to run phpcs (PHP_CodeSniffer) with [GitHub Actions](https://github.com/features/actions) platform. It also supports [annotations](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-status-checks#checks) out of the box — you don't need to use any tokens to make it work. 

<img src="https://leonardo.osnova.io/491e4ce9-72d9-9417-29f7-9934ce7ec8ad/" alt="How Annotations Works" title="How Annotations Works" width="560" height="432" />

## Usage

Add the following code to `.github/workflows/phpcs.yml` file.

```yaml
name: PHPCS check

on: pull_request

jobs:
  phpcs:
      name: PHPCS
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v2
        - name: PHPCS check
          uses: agoja/drupal-phpcs-action@v0.1
```
