# gh-deploy

> A **one-liner** to kick-start static pages, using GitHub Pages

This module will:

* Create a new repo, following GitHub Pages convention
* Add a stub index.html
* Clone the repo into the current folder

As a result you will:

* Have a deployed HTML page on GitHub
* Have a cloned Git repository, ready to make further changes

## Installation

  npm install -g gh-deploy

## Demo

[Part I (19 seconds)](http://youtu.be/vJlg-0y2fTY) - Hello World

[Part II (36 seconds)](http://youtu.be/5stwAqtgWTg) - Deploy Todo MVC


## Usage

```
gh-deploy reponame username
```

* **reponame** - name of the github repository. Defines the page URL
* **username** - GitHub username

### Page URL

GitHub offers two options for page URLs:

* http://*username*.github.io - use *username*.github.io as the **reponame**
* http://*username*.github.io/*reponame* - use any other **reponame**

## Credit
Inspired by [microstatic](https://github.com/moredip/microstatic) and [awestruck](http://awestruct.org/)

## Release History

* 0.1.0 Initial release
