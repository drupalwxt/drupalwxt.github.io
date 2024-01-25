---
title: "Release Process"
linkTitle: "Release Process"
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
- release
---

## Select a version number

WxT releases are numbered using a form of semantic versioning. More information can be found in our **[Versioning]({{< relref "/docs/development/version" >}})** page.

`MAJOR.FEATURE.SPRINT`

In general, when preparing a release: increment the FEATURE when Drupal Core has a major release (ie. 9.5.x to 10.0.x) otherwise simply increment the SPRINT number.

## Create an issue on GitHub.com

Create an issue in the **[Drupal WxT](https://github.com/drupalwxt/wxt)** project on GitHub for release tracking, title it `Release x.x.x` (where x.x.x is the incremented version number).

This issue should contain the following checklist as well as any other related steps or information regarding preparing the release.

```sh
See the [full release documentation](https://drupalwxt.github.io/docs/development/release-process/) for more detail.

- [ ] All related projects (wxt_library and wxt_bootstrap) tagged and released on GitHub.com and Drupal.org
- [ ] Version number selected
- [ ] CHANGELOG.md updated
- [ ] composer.json updated
- [ ] Run version.sh for hook_updates and wxt contrib
- [ ] CI build passes
- [ ] Releases tagged and pushed to GitHub.com and Drupal.org
- [ ] WxT released on Drupal.org (https://drupalwxt.github.io/docs/development/release-process/#release)
- [ ] Add changelog information to published tag once CI is done
```

## Update changelog

Ensure the changelog contains an entry for the release and is updated as issues and changes are resolved (in the next steps or when committing code / changes).

## Review dependent wxt modules

1. Review contrib modules in composer.json (or in a site install; extend->update) and update as necessary.
1. If necessary, tag **[wxt_library](https://github.com/drupalwxt/wxt_library)** and update **[wxt][wxt]**'s `composer.json` file
2. If necessary, tag **[wxt_bootstrap](https://github.com/drupalwxt/wxt_bootstrap)** and update **[wxt][wxt]**'s `composer.json` file

All projects must be released on drupal.org (and github).

> **Note**: Changes to `composer.json` file (specifically dev dependencies and repositories) should be mentioned in the CHANGELOG.

### Drupal.org version

Drupal.org does not currently support semantic versioning. Instead, the version number on drupal.org is `10.x-X.YZZ`, where:

- `X = MAJOR`
- `Y = FEATURE`
- `ZZ = SPRINT` (two digits - add leading zero for < 10)

## Check composer.json

If the wxt dependent modules are updated, we need to reflect this in wxt `composer.json` and the CHANGELOG.

- `git clone https://github.com/drupalwxt/wxt.git`
- Confirm or update that it's using appropriate tags of **[wxt_library][wxt-library]** + **[wxt_bootstrap][wxt-bootstrap]** (`composer.json`)
- Push to github.com and drupal.org repositories any changes
- Ensure GitHub Actions build passes

## Tag WxT

### GitHub.com and Drupal.org

- `git tag MAJOR.FEATURE.SPRINT`
- `git push $GITHUB_REMOTE MAJOR.FEATURE.SPRINT`

## Release

### GitHub.com

1. Go to **[Tags][wxt-tags]** page
2. Click ... and select create release on the tag
3. Enter the version number in the *release title*
4. Copy the changelog entry for this release into the `release notes`
5. Click publish release

### Drupal.org

The builds on Drupal.org are incomplete as they don't fully support Composer yet which is why we host a tarball on GitHub for those not using Composer.

1. **[Drupal WxT Release Page][wxt-release]**
2. Select the tag
3. Copy/paste the following blurb into the release notes:

```sh
<strong>CHANGELOG</strong>

See the <a href="https://github.com/drupalwxt/wxt/blob/5.2.x/CHANGELOG.md">changelog.md</a> file.
```

<!-- Links Referenced -->

[wxt]:           https://github.com/drupalwxt/wxt
[wxt-bootstrap]: https://github.com/drupalwxt/wxt_bootstrap
[wxt-library]:   https://github.com/drupalwxt/wxt_library
[wxt-release]:   https://www.drupal.org/node/add/project-release/2619112
[wxt-tags]:      https://github.com/drupalwxt/wxt/tags
