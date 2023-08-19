---
title: "Configuration Management"
linkTitle: "Configuration Management"
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
- configuration
---

Drupal WxT thanks to the work done by the Acquia Team is able to use advanced
configuration management strategies.

At the moment this remains an opt-in process and you will have to add the
following modules to your `composer.json` before you add the code snippet
below to your `settings.php` file.

- **[Configuration Split][config-split]**
- **[Configuration Ignore][config-ignore]**

Once enabled all default configuration will be stored in `/sites/default/files/config/default/`
and then depending on your environment additionally configuration splits can
be leveraged depending on your `SDLC`.

```php
/**
 * Configuration Split for Configuration Management
 *
 * WxT is following the best practices given by Acquia for configuration
 * management. The "default" configuration directory should be shared between
 * all multi-sites, and each multisite will override this selectively using
 * configuration splits.
 *
 * To disable this functionality simply set the following parameters:
 * $wxt_override_config_dirs = FALSE;
 * $settings['config_sync_directory'] = $dir . "/config/$site_dir";
 *
 * See https://github.com/acquia/blt/blob/12.x/settings/config.settings.php
 * for more information.
 */

use Drupal\wxt\Robo\Common\EnvironmentDetector;

if (!isset($wxt_override_config_dirs)) {
  $wxt_override_config_dirs = TRUE;
}
if ($wxt_override_config_dirs) {
  $config_directories['sync'] = $repo_root . "/var/www/html/sites/default/files/config/default";
  $settings['config_sync_directory'] = $repo_root . "/var/www/html/sites/default/files/config/default";
}
$split_filename_prefix = 'config_split.config_split';
if (isset($config_directories['sync'])) {
  $split_filepath_prefix = $config_directories['sync'] . '/' . $split_filename_prefix;
}
else {
  $split_filepath_prefix = $settings['config_sync_directory'] . '/' . $split_filename_prefix;
}

/**
 * Set environment splits.
 */
$split_envs = [
  'local',
  'dev',
  'test',
  'qa',
  'prod',
  'ci',
];
foreach ($split_envs as $split_env) {
  $config["$split_filename_prefix.$split_env"]['status'] = FALSE;
}
if (!isset($split)) {
  $split = 'none';
  if (EnvironmentDetector::isLocalEnv()) {
    $split = 'local';
  }
  if (EnvironmentDetector::isCiEnv()) {
    $split = 'ci';
  }
  if (EnvironmentDetector::isDevEnv()) {
    $split = 'dev';
  }
  elseif (EnvironmentDetector::isTestEnv()) {
    $split = 'test';
  }
  elseif (EnvironmentDetector::isQaEnv()) {
    $split = 'qa';
  }
  elseif (EnvironmentDetector::isProdEnv()) {
    $split = 'prod';
  }
}
if ($split != 'none') {
  $config["$split_filename_prefix.$split"]['status'] = TRUE;
}

/**
 * Set multisite split.
 */
// $config["$split_filename_prefix.SITENAME"]['status'] = TRUE;
```

<!-- Links Referenced -->

[config-ignore]: https://www.drupal.org/project/config_ignore
[config-split]:  https://www.drupal.org/project/config_split
