---
title: "Overview"
linkTitle: "Overview"
weight: 1
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
- composer
- general
- install
---

The [Drupal WxT](https://github.com/drupalwxt/wxt) distribution is designed for organizations that must meet accessibility and bilingualism standards. It attempts to integrate with the design patterns found in the [WET-BOEW and Canada.ca design system](https://design.canada.ca/), including the mandatory [Content and Information Architecture (C&IA) Specification](https://wet-boew.github.io/GCWeb/index-en.html) for the Government of Canada.

To make working with Drupal WxT easier, there are potentially three ways you can approach it.

### Distribution

The Drupal WxT distribution method stands out as a preferred choice for web developers and organizations seeking a robust web development solution.

Unlike a standalone installation, the distribution provides a comprehensive package of features and workflows that have been vetted and tested by the Drupal WxT community based on real world use cases.

This means users can leverage a well-established framework with proven capabilities, saving time and effort in development while ensuring stability and reliability.

By opting for the distribution method, teams gain access to shared resources, ongoing support, and a community-driven ecosystem, hopefully helping to build accessible, and bilingual web experiences with confidence.

#### Benefits

* Many canadian departments and organizations have contributed features and improvements
* Has received several security and accessibility audits to the codebase and markup
* Will stay on top of security releases within a maximum of 72 hours of posting
* Creation of many plugins in order to more fully integrate with the [WET-BOEW and Canada.ca design system](https://wet-boew.github.io/GCWeb/index-en.html)
* Best effort open source support from a community of developers
* Provides upgrade paths for all supported components
* Additional functionality is provided by WxT Extend modules which target a specific feature
* Stays on top of performance related issues taking into account both MySQL and PostgreSQL

#### Components

<table>
   <thead>
      <tr>
         <th>Component</th>
         <th>Features</th>
         <th>Machine Name</th>
         <th>Type</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><strong><a href="https://github.com/drupalwxt/wxt">WxT</a></strong></td>
         <td>
            <ul>
               <li>Provides a custom installation profile</li>
            </ul>
         </td>
         <td>wxt</td>
         <td>Distribution</td>
      </tr>
      <tr>
         <td><strong><a href="https://github.com/drupalwxt/wxt_bootstrap">WxT Bootstrap</a></strong></td>
         <td>
            <ul>
               <li>Provides Templates to adhere to the WET-BOEW and Canada.ca Design System and C&amp;IA Specification</li>
               <li><a href="https://www.drupal.org/project/wxt/issues/3393668">#3393668</a> - Toggle webforms between “Report a Problem” and “Did you find what you were lolking for?” on a per page basis</li>
            </ul>
         </td>
         <td>wxt_bootstrap</td>
         <td>Standalone</td>
      </tr>
      <tr>
         <td><strong><a href="https://github.com/drupalwxt/wxt_library">WxT Library</a></strong></td>
         <td>
            <ul>
               <li>Integrates Drupal with WET-BOEW Framework Assets (CSS/JS)</li>
            </ul>
         </td>
         <td>wxt_library</td>
         <td>Standalone</td>
      </tr>
      <tr>
         <td><strong><a href="https://github.com/drupalwxt/wxt/tree/5.2.x/modules/custom/wxt_admin">WxT Admin</a></strong></td>
         <td>
            <ul>
               <li>Provides the default configuration and various helper methods for administrative tasks</li>
            </ul>
         </td>
         <td>wxt_admin</td>
         <td>Distribution</td>
      </tr>
      <tr>
         <td><strong><a href="https://github.com/drupalwxt/wxt/tree/5.2.x/modules/custom/wxt_core">WxT Core</a></strong></td>
         <td>
            <ul>
               <li>Provides the core configuration and all update related hooks for WxT as a whole</li>
            </ul>
         </td>
         <td>wxt_core</td>
         <td>Distribution</td>
      </tr>
      <tr>
         <td><strong><a href="https://github.com/drupalwxt/wxt/tree/5.2.x/modules/custom/wxt_ext">WxT Extend</a></strong></td>
         <td>
            <ul>
               <li>Provides 40+ micro modules where target only a specific feature within the <a href="https://wet-boew.github.io/GCWeb/index-en.html">WET-BOEW and Canada.ca design system</a>:</li>
               <ul>
                  <li><strong>Archived</strong>: Creates an archived alert block triggered by a checkbox field on a entity // <a href="https://www.drupal.org/project/wxt/issues/3097228">#3097228</a></li>
                  <li><strong>Blocks</strong>: Creates custom blocks of type Basic, Search, Spotlight, and Modal (ability to use blocks as modal for CKEditor // <a href="https://www.drupal.org/project/wxt/issues/3391443">#3391443</a></li>
                  <li><strong>Blog</strong>: Creates a default Blog listing layout page // <a href="https://www.drupal.org/project/wxt/issues/3306505">#3306505</a></li>
                  <li><strong>Book</strong>: Configures book module to support GC Subway functionality // <a href="https://www.drupal.org/project/wxt/issues/3219195">#3219195</a>)</li>
                  <li><strong>Breadcrumb</strong>: Configures breadcrumb and related functionality // <a href="https://www.drupal.org/project/wxt/issues/3203791">#3203791</a></li>
                  <li><strong>Carousel</strong>: Creates custom block of type Carousel // <a href="https://www.drupal.org/project/wxt/issues/3313685">#3313685</a></li>
                  <li><strong>Comment</strong>: Default comment functionality</li>
                  <li><strong>Editor</strong>: CKEditor integration with filters for Data Tables and addition of several plugins (WET Alert, Panels) // <a href="https://www.drupal.org/project/wxt/issues/3255971">#3255971</a></li>
                  <li><strong>Font Awesome</strong>: Default fontawesome functionality</li>
                  <li><strong>Group</strong>: Default Group functionality along with mappings to import all departments through Migrate using the <a href="https://open.canada.ca/data/en/datastore/dump/04cbec5c-5a3d-4d34-927d-e41c9e6e3736?format=json">Open Data API</a></li>
                  <li><strong>Landing Page</strong>: Default Landing Page functionality</li>
                  <li><strong>Layout</strong>: Default Layout functionality and enhancements</li>
                  <li><strong>Media</strong>: Default Media functionality and enhancements</li>
                  <li><strong>Media Audio</strong>: Default Audio entity type for Media</li>
                  <li><strong>Media Bulk Upload</strong>: Default improvements to Bulk Upload for Media</li>
                  <li><strong>Media Document</strong>: Default Document entity type for Media</li>
                  <li><strong>Media Image</strong>: Default Image entity type for Media</li>
                  <li><strong>Media Image Responsive</strong>: Responsive image support for Media</li>
                  <li><strong>Media Instagram</strong>: Default Instagram entity type for Media</li>
                  <li><strong>Media Slideshow</strong>: Default Slideshow entity type for Media</li>
                  <li><strong>Media Twitter</strong>: Default Twitter entity type for Media</li>
                  <li><strong>Media Video</strong>: Default Video entity type for Media</li>
                  <li><strong>Metatag</strong>: Allow setting GC Adobe Analytics metatag attributes // <a href="https://www.drupal.org/project/wxt/issues/3415924">#3415924</a></li>
                  <li><strong>Migration</strong>: Extensive Migration functionality along with numerous plugins and default content</li>
                  <li><strong>Page</strong>: Customizations for the Page content type, including Lead Title // <a href="https://www.drupal.org/project/wxt/issues/3389645">#3389645</a></li>
                  <li><strong>Paragraph</strong>: Default Paragraph functionality</li>
                  <li><strong>Password Policy</strong>: Default strong ISM password policy // <a href="https://www.drupal.org/project/wxt/issues/3252532">#3252532</a></li>
                  <li><strong>Queue</strong>: Queue functionality along with views argument plugins related to SubQueue support</li>
                  <li><strong>Search</strong>: Default setup for Search API</li>
                  <li><strong>Search DB</strong>: Default setup for Search w/Database Backend</li>
                  <li><strong>Sitemap</strong>: Default Sitemap functionality</li>
                  <li><strong>Taxonomy</strong>: Default taxonomy vocabularies used for categorizing content</li>
                  <li><strong>Theme</strong>: Default Theme setup for frontend and backend</li>
                  <li><strong>User</strong>: Default User functionality along with plugin for User Dropdown block</li>
                  <li><strong>Webform</strong>: Webform enhancements along with custom plugins (Report a Problem, Did you Find) and SCCAI 2019 support // <a href="https://www.drupal.org/project/wxt/issues/3111375">#3111375</a></li>
                  <li><strong>Workflow</strong>: Workflow enhancements to improve content editing experience</li>
               </ul>
            </ul>
         </td>
         <td>wxt_extend</td>
         <td>Distribution</td>
      </tr>
      <tr>
         <td><strong><a href="https://github.com/drupalwxt/wxt/tree/5.2.x/modules/custom/wxt_translation">WxT Translation</a></strong></td>
         <td>
            <ul>
               <li>Ensures that both of the official languages for Canada are setup correctly</li>
               <li>
                  Provides additional functionality for interacting with Drupal Core’s language subsystem:
                  <ul>
                     <li>Translation helper class for importing translations for a given module</li>
                     <li>Various other helper methods for enabling, importing and updating translations</li>
                  </ul>
               </li>
            </ul>
            <ul></ul>
         </td>
         <td>wxt_translation</td>
         <td>Distribution</td>
      </tr>
   </tbody>
</table>

### Standalone Installation

A standalone installation allows you to install and configure the standalone components type discussed in the previous section separately without relying on a pre-packaged distribution (composer project).

A composer project will often include multiple modules whether both custom and contributed along with the various configuration and dependencies they will rely on.

Drupal WxT offers a standalone installation as an alternative for those users who don't want the full weight of a distribution and prefer more control over their setup while still conforming to the [Government of Canada C&IA Specification](https://wet-boew.github.io/GCWeb/index-en.html).

Instead users can opt to create their own distribution (composer project) and install only the specific modules and themes required for their needs.

At a minimum and to comply with the [WET-BOEW and Canada.ca design system](https://wet-boew.github.io/GCWeb/index-en.html) you only need use 2 components.

#### Benefits

* Can still conform to the [Government of Canada C&IA Specification](https://wet-boew.github.io/GCWeb/index-en.html)
* Numerous accessibility audits to help improve markup and content information architecture
* Integrates tightly with the [WET-BOEW and Canada.ca design system](https://wet-boew.github.io/GCWeb/index-en.html)
* Best effort open source support with a community of developers
* Provides upgrade paths for all supported components

#### Components

| Component                                                                                                  | Features                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Machine Name    | Type         |
|------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|--------------|
| **[WxT Bootstrap (Theme)](https://github.com/drupalwxt/wxt_bootstrap)**                                    | <ul><li>Provides Templates to adhere to the C&IA Specification</li></ul>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | wxt_bootstrap   | Standalone   |
| **[WxT Library (Module)](https://github.com/drupalwxt/wxt_library)**                                       | <ul><li>Integrates Drupal with WET-BOEW Framework Assets (CSS/JS)</li></ul>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | wxt_library     | Standalone   |

For the WET-BOEW Framework Assets it is mandatory that you follow the expected [naming convention](https://github.com/drupalwxt/wxt_library/blob/8.x-7.x/composer.json#L21-L29) and that these files be placed within the `/libraries` folder.

For you convenience all of these components are already part of a composer repository that can be added very easily to your new or existing composer project.

```composer
{
    ...
    "require": {
        ...
        "drupal/wxt_bootstrap": "^8.0",
        "drupal/wxt_library": "^8.0",
    },
    ...
    "repositories": [
        {
            "type": "composer",
            "url": "https://drupalwxt.github.io/composer-extdeps/"
        }
    ],
    ...
}
```

> **Note**: It is still recommended to use the distribution method, as the standalone option receives limited support and you will lose out on some of the functionality / plugins that help to more fully integrate with the [WET-BOEW and Canada.ca design system](https://wet-boew.github.io/GCWeb/index-en.html).

### Leverage as a Reference Implementation

If you prefer full control over your codebase and want to reduce external dependencies, you can use Drupal WxT as a reference implementation.

This means that, as long as you provide proper attribution, you have the freedom to copy or fork any part of the codebase and incorporate it into your own project.

The main drawback of this approach is that you won't receive community support and also won't have the same tight integration of features with the [WET-BOEW and Canada.ca design system](https://wet-boew.github.io/GCWeb/index-en.html).

However you can selectively choose exactly what you need for your project, potentially saving some time and reducing additional external dependencies.

Our advice at the end of the day is you must consider what is best for your department or organization in the long term.
