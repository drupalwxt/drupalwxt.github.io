# Website

[Docsy](https://github.com/google/docsy) is a Hugo theme for technical documentation sites, providing easy site navigation, structure, and more.

> This Docsy derived project is hosted at [https://drupalwxt.github.io/](https://drupalwxt.github.io/). You can find detailed theme instructions in the Docsy user guide: https://docsy.dev/docs/

## Installing Hugo

This repository is presently using Hugo extended 0.101.0 which is available at the bottom of its [release page](https://github.com/gohugoio/hugo/releases/tag/v0.101.0).

## Cloning

The following will give you a project that is set up and ready to use.

The `hugo server` command builds and serves the site.

If you just want to build the site, run `hugo` instead.

```sh
git clone https://github.com/drupalwxt/drupalwxt.github.io
cd drupalwxt.github.io
./dev.sh
```

The theme is included as part of a Hugo module:

```sh
▶ hugo mod graph
project github.com/google/docsy@v0.6.0+vendor
project github.com/google/docsy/dependencies@v0.6.0+vendor
project github.com/twbs/bootstrap@v4.6.2+incompatible+vendor
project github.com/FortAwesome/Font-Awesome@v0.0.0-20220831210243-d3a7818c253f+vendor
```

If you want to do SCSS edits and want to publish these, you need to install `PostCSS` (not needed for `hugo server`):

```sh
npm install
```

## Running the website locally

Once you've cloned the site repo, from the repo root folder, run:

```sh
./dev.sh
```

## Linting

To lint all Markdown files in a Node.js project (excluding dependencies), the following commands might be used:

Windows CMD

```sh
markdownlint content/**/*.md --ignore node_modules --fix
```

Linux Bash

```sh
markdownlint 'content/**/*.md' --ignore node_modules --fix
```

## Acknowledgements

Thanks to the following projects for showing us how to clearly architect a docsy project:

* [Knative](https://knative.dev)
* [Docsy Example](https://github.com/google/docsy-example)
* [Cloud Platform User Guide](https://user-guide.cloud-platform.service.justice.gov.uk/#cloud-platform-user-guide)
