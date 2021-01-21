 Running Prestashop on gitpod

# Work In Progress NOT WORKING YET
- V1.0 : Minimal configuration to install Prestashop.

[Gitpod](https://www.gitpod.io) is a ready-to-code dev environment with a single click. It will allows you to develop plugin or theme directly from your browser.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/PasLoin/gitpod-prestashop)

https://gitpod.io/#https://github.com/PasLoin/gitpod-prestashop/tree/dev


## Features

- LAMP (Apache, MySQL, PHP)
- [Composer](https://getcomposer.org/)
- [NVM](https://github.com/nvm-sh/nvm)
- [Node.js](https://nodejs.org/) (LTS)
- Git
- SVN
- [MailHog](https://github.com/mailhog/MailHog)

## Install

Project dependencies (in `composer.json` or `package.json`) are automatically installed.

- V1.0 : You will have a 403 error when gitpod open port 8080 ; it's "normal" ; when he finished to dowload prestashop, just refresh the page and you can make the install. 
- V1.1 : WIP install automatically

## Usage

Your admin credentials:

```
username: admin
password: password
```

## Contributing

To contribute, follow these steps:

1. Fork this repository.
1. Create a branch: `git checkout -b <branch_name>`.
1. Make your changes and commit them: `git commit -m '<commit_message>'`
1. Push to your fork: `git push origin <branch_name>`
1. Create the Pull Request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

Just found a bug? Report it on GitHub [Issues](https://github.com/PasLoin/gitpod-prestashop/issues).

## LICENSE

MIT 
---

Made with ❤ and &#128296;  in Belgium.

Fully inspired by Luiz Paulo "Bills" https://github.com/luizbills/gitpod-wordpress/
