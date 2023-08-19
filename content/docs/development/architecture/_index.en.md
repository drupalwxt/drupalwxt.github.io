---
title: "Architecture"
linkTitle: "Architecture"
weight: 15
type: "landing"
draft: false
translated: false
resources:
  - src: "**.{png,jpg}"
    title: "Image #:counter"
    params:
      byline: "Image: Drupal / CC-BY-CA"
categories:
- wxt
tags:
- architecture
---

The goal of **[Drupal WxT][wxt]** since the 4.1.x line is to make the installation profile very minimal by default but providing additional extensions that can be enabled as desired.

What WxT offers is some light enhancements to Drupal Core, mainly around security and performance, and integration with the Web Experience Toolkit. By default, the distribution offers minimal functionality to allow full customizations by users. However a great deal of optional extensions are available that can provide additional functionality generally beneficial to Government departments.

> **Note**: In the future we are looking into providing a list of community modules that are build to work with the distribution but are "out of tree".

All of the optional modules are located in the `wxt_ext` folder named after WxT Extend and can be enabled during the initial site installation by passing the following flag via the drush cli:

```sh
wxt_extension_configure_form.select_all='TRUE'
```

> **Note**: If you wish to only install the minimum set of dependencies please remove the `wxt_extension_configure_form.select_all='TRUE'` flag in its entirety.

In order to provide a list of the optional enabled extensions during the installation that can be checked, all that any module has to do is provide a `modulename.wxt_extension.yml` file in their root and they will be picked as installable during the profile install and also respond to the additional drush flag discussed above.

For more information on some of the history leading to this design:

- [WxT Minimal Install][wxt-minimal-install]
- [Roadmap for Drupal 9][wxt-roadmap]

<!-- Links Referenced -->

[wxt]:                       https://github.com/drupalwxt/wxt
[wxt-minimal-install]:       https://www.drupal.org/project/wxt/issues/3182208
[wxt-roadmap]:               https://www.drupal.org/project/wxt/issues/3182977
