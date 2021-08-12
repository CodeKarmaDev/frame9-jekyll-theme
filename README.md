# Frame9 Jekyll Theme

A small flexible gallery theme for [jekyll](https://jekyllrb.com/).
The main feature is the 9 pane gallery element.



## Installation & configuration

Fist install jekyll and create a project
[Jekyll quick start guide](https://jekyllrb.com/docs/)

Add the theme gem to your gemfile then do a `bundle install`.
```ruby
gem 'frame9-jekyll-theme', '~> 1.0'
```

Install [gorko](https://github.com/andy-piccalilli/gorko) with npm.
```bash
npm init -y
npm install gorko
```


Add the theme to your `_config.yml`
```yml
theme: frame9-jekyll-theme
```

### Collections and Defaults
You will want to configure the `collections` and `defaults`.

```yml
collections:
  sections:     # Used for adding sub_sections to pages
    output: false       
  tabs:         # Each tab shows up as a page in your sites nav
    sort_by: order
    output: true
    permalink: /:name/

defaults:
  - scope:      # Use the section layout for sub_sections
      path: ''
      type: section
    values:
      layout: section

  - scope:      # use the default layout for tabs
      path: ''
      type: tabs
    values:
      layout: default

  - scope:      # Use the post layout for posts
      path: ''
      type: posts
    values:
      layout: post
      show_sibling_nav: true # Display `next` and `previous` links at the bottom of each post
```


### Frame9 config options
```yml
frame9:
  show_current_tab: false               # display the current page in the navigation.
  avatar: 'assets/img/avatar.png'       # Your logo or avatar
  banner: 'assets/img/banner.jpg'       # optional banner image

  footer_links:                         # footer links
    - title: Github
      url: 'https://github.com/CodeKarmaDev/frame9-jekyll-theme'
```


### Tabs

Each page you create in the `_tabs` folder will show up as a page in the site navigation.

You can arrange them with the `order` tag in the header.

I recommend crating a page under `_tabs/home.md`

```yml
---
title: home
permalink: /
order: 0
---

# Your Heading
{% include gallery.html items=site.posts openable=true limit=9 %}
```

### Sub Sections

In a page header you can define a `sub_sections` list.
```yml
_sections/toc.md
---
title: TOC
---

## Table Of Contents

{% for post in site.posts %}
[{{ post.title }}]({{ doc.url }})
{% endfor %}
```
```yml
_tabs/posts.md
---
sub_sections:
- TOC
```

### Gallery Include Tag


The `gallery.html` include displays a panel of images.
It takes five passable parameters `items`, `openable`, `viewer`, `limit`, and `class` 
```liquid
{% include gallery.html items=site.posts openable=true limit=12 %}
```

You can pass the gallery include tag a collection or a list of "Gallery Item Objects"


| Tag | Description | Default |
| :-- | :-- | --: |
| `items` | Accept a collection or a list of gallery items | `required` |
| `openable` | will make each images a hyperlink to its own page. | `false` |
| `viewer` | Each image will enlarge when clicked | `false` |
| `limit` | can set the max amount of images to display in the panel | `9`. |
| `class` | adds custom classes to the `img-wrapper` element. | `""` |


#### Gallery Item Object

A gallery item object should to have `image` and `alt` properties.
with optional `summery` and `url` properties.
When using a collection you can define these in the markdown header. 

| Tag | Description | Default |
| :-- | :-- | --: |
| `image` | the path to a image file | `Required` |
| `alt` | the alt for the image | `Recommended` |
| `summery` | some markdown that displays a preview in the gallery. | it defaults to [jekyll's excerpt property](https://jekyllrb.com/docs/posts/#post-excerpts) |
| `url` | the url to open when openable is enabled | With a collection Jekyll handles it for you |

```yaml
_posts/yyyy-mm-dd-example.md
---
image: assets/img/post1.jpg 
alt: A cool picture of something 
summery: >-                     
    ### Title
    Sub Title
url: /my/post/                      
```

#### Gallery Item Include

You can also use `gallery_item.html` directly.
You might want to display the image on its own page for example.
It accepts `item`, `viewer`, `openable`, and `class`.
the `item` being a single Gallery Item Object.

```liquid
{% include gallery_item.html item=page viewer=true class="float-left mb-x" %}
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/frame9-jekyll-theme.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
