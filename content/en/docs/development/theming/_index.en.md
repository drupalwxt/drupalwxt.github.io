---
title: "Theming"
linkTitle: "Theming"
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
- theming
---

Largely when doing any theme related work with **[Drupal WxT][wxt]** this almost always should be done in a sub-theme.

For more on creating sub-themes please consult the official documentation:

- **[Creating sub-themes][sub-themes]**

To assist with sub-theme creation **[WxT Bootstrap][wxt_bootstrap]** provides an example starterkit that should be of benefit.

> **Note**: Sub-themes are just like any other theme except they inherit the parent theme's resources.

## Sub Theme Configuration

a) Replace every instance of `THEMENAME` with your chosen machine name often of the pattern `<prefix>_bootstrap`.

b) Enable your new sub-theme preferably via **[drush][drush]**:

```sh
drush en `<prefix>_bootstrap`
drush cc css-js
```

c) Point to your new sub theme for **[WxT Library][wxt_library]** to properly load assets under **Themes Visibility** on the `/admin/config/wxt/wxt_library` page.

## Notes

### Inheriting Block Templates

If the theme you are extending has custom block templates these won't be immediately inherited because a sub-theme creates copies of all the blocks in the parent theme and renames them with the sub-theme's name as a prefix. Twig block templates are derived from the block's name, so this breaks the link between these templates and their block.

To fix this problem it requires a hook in the sub-theme by adding the following code snippet to the `THEMENAME.theme` file:

### Programmatic Logic

The following provides an example of how you can configure your sub theme to be installed as the default on a module install:

```php
/**
 * Implements hook_modules_installed().
 */
function MODULENAME_modules_installed($modules) {
    if (in_array('wxt', $modules)) {
      \Drupal::configFactory()
        ->getEditable('system.theme')
        ->set('default', 'THEMENAME')
        ->set('admin', 'claro')
        ->save(TRUE);
    }
  }
}
```

The following provides an example of how you can configure `wxt_library` to use your sub theme by creating a `config/install/wxt_library.settings.yml` file with the following contents:

```yaml
url:
  visibility: 0
  pages:
    - 'admin*'
    - 'imagebrowser*'
    - 'img_assist*'
    - 'imce*'
    - 'node/add/*'
    - 'node/*/edit'
    - 'print/*'
    - 'printpdf/*'
    - 'system/ajax'
    - 'system/ajax/*'
theme:
  visibility: 1
  themes:
    THEMENAME: THEMENAME
    wxt_bootstrap: wxt_bootstrap
minimized:
  options: 1
files:
  types:
    css: css
    js: js
wxt:
  theme: theme-gcweb
```

<!-- Links Referenced -->

[drush]:         https://www.drush.org/latest/
[sub-themes]:    https://www.drupal.org/docs/theming-drupal/creating-sub-themes
[wxt]:           https://github.com/drupalwxt/wxt
[wxt_bootstrap]: https://www.drupal.org/project/wxt_bootstrap
[wxt_library]:   https://www.drupal.org/project/wxt_library
