---
title: "Roadmap"
linkTitle: "Roadmap"
weight: 10
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
- general
- roadmap
---

{{% alert color="warning" %}}
The **roadmap** helps guide the project and helps to steer the technical design decisions.
{{% /alert %}}

The core distribution will always strive to be:

- As minimal as possible on top of Drupal Core providing performance, scalability, and security features on top of it
- Provide best practices for users to follow which includes our Composer workflow, CI / CD methodologies, and deployment strategies
- Provide a place for all Government Departments to inherit the base requirements such as Language Handling, GC Approved Themes, and other functionalities such as Date Format, Metadata Output, and Accessibility improvements

Beyond the above the distribution will provide extensible features that can be opted into through the wxt_ext suite of modules:

- Each of these modules must explicitly state all of there contributed dependencies
- Governance around these "extension" modules can be a bit looser
- These modules should be clear in focus and not try to do to much other then an immediate task at hand
- These modules should have an `modulename.wxt_extension.yml` file so can be enabled as optional extension during profile installation

In addition, **[Drupal WxT][wxt]** will offer out of tree (external) modules that implement specific features:

- These features are not included by the core platform because they are only used by a subset of users
- These modules may be subject to change though update hooks will always be provided
- Community supported modules will also be listed in our README of additional modules but will not be supported by the Drupal WxT team

> **Note**: The governance around the core distribution will always be much stricter then the governance around adding a `wxt_ext` or an out of tree module.

<!-- Links Referenced -->

[wxt]:         https://github.com/drupalwxt/wxt
