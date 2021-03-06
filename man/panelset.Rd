% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/panelset.R
\name{panelset}
\alias{panelset}
\alias{use_panelset}
\alias{style_panelset_tabs}
\alias{style_panelset}
\alias{html_dependency_panelset}
\title{Panelset}
\usage{
use_panelset()

style_panelset_tabs(
  foreground = NULL,
  background = NULL,
  ...,
  active_foreground = NULL,
  active_background = NULL,
  active_border_color = NULL,
  hover_background = NULL,
  hover_foreground = NULL,
  hover_border_color = NULL,
  tabs_border_bottom = NULL,
  inactive_opacity = NULL,
  font_family = NULL,
  selector = ".panelset"
)

style_panelset(...)

html_dependency_panelset()
}
\arguments{
\item{foreground}{The text color of a non-active panel tab, default is
\code{currentColor}.}

\item{background, active_background, hover_background}{Background colors for
panel tabs; in-active tabs, active tab, hovered tab. The default values are
all \code{unset}.}

\item{...}{Ignored or passed from \code{style_panelset()} to \code{style_panelset_tabs()}.}

\item{active_foreground}{The text color of an active, as in selected, panel
tab. Default is \code{currentColor}.}

\item{active_border_color, hover_border_color}{The color of the top border of
a tab when it is active or the color of the bottom border of a tab when it
is hovered or focused. Defaults are \code{currentColor}.}

\item{hover_foreground}{The text color of a hovered panel tab. Default is
\code{currentColor}.}

\item{tabs_border_bottom}{The border color between the tabs and content.
Default is \verb{#ddd}.}

\item{inactive_opacity}{The opacity of inactive panel tabs, default is \code{0.5}.}

\item{font_family}{The font family to be used for the panel tabs text.
Default is a monospace system font stack.}

\item{selector}{The CSS selector used to choose which panelset is being
styled. In most cases, you can use the default selector and style all
panelsets on the page.}
}
\value{
An \code{htmltools::tagList()} with the panelset dependencies, or an
\code{\link[htmltools:htmlDependency]{htmltools::htmlDependency()}}.
}
\description{
A panelset designed for showing off code, but useful for anything really.
}
\section{Functions}{
\itemize{
\item \code{use_panelset}: Adds panelset to your xaringan slides.

\item \code{style_panelset_tabs}: Style the panelset. Returns an \pkg{htmltools} \verb{<style>}
tag.

\item \code{style_panelset}: Deprecated, renamed \code{style_panelset_tabs()}.

\item \code{html_dependency_panelset}: Returns an \code{\link[htmltools:htmlDependency]{htmltools::htmlDependency()}} with the tile
view dependencies. Most users will want to use \code{use_panelset()}.
}}

\section{Usage}{
 To add panelset to your xaringan presentation, add the
following code chunk to your slides' R Markdown file.\if{html}{\out{<div class="markdown">}}\preformatted{```\{r xaringan-panelset, echo=FALSE\}
xaringanExtra::use_panelset()
```

.panelset[
.panel[.panel-name[app.R]

```r
hist(runif(100))
```
]

.panel[.panel-name[About]

Take a look at the R code in that other panel.
]
]
}\if{html}{\out{</div>}}
}

\section{Style Panelset}{
To customize the appearance of your panels, you can use
\code{style_panelset_tabs()} called directly in an R chunk in your slides.\if{html}{\out{<div class="markdown">}}\preformatted{```\{r echo=FALSE\}
style_panelset_tabs(foreground = "honeydew", background = "seagreen")
```
}\if{html}{\out{</div>}}

The panelset uses opacity to soften the in-active tabs to increase the
chances that the tabs will work with your slide theme. If you decide to
change your tab colors or to use solid colored tabs, you’ll likely want
to set \code{inactive_opacity = 1} in \code{style_panelset()} (or the
corresponding \code{--panel-tab-inactive-opacity} CSS variable).

Behind the scenes, \code{style_panelset_tabs()} updates the values of \href{https://developer.mozilla.org/en-US/docs/Web/CSS/--*}{custom CSS properties}
that define the panelset appearance. If you’d rather work with CSS, the
default values of these properties are shown in the CSS code below. You
can copy the whole CSS block to your slides and modify the values to
customize the style to fit your presentation.\if{html}{\out{<div class="markdown">}}\preformatted{```\{css echo=FALSE\}
.panelset \{
   --panel-tab-foreground: currentColor;
   --panel-tab-background: unset;
   --panel-tab-active-foreground: currentColor;
   --panel-tab-active-background: unset;
   --panel-tab-active-border-color: currentColor;
   --panel-tab-hover-foreground: currentColor;
   --panel-tab-hover-background: unset;
   --panel-tab-hover-border-color: currentColor;
   --panel-tab-inactive-opacity: 0.5;
   --panel-tabs-border-bottom: #ddd;
   --panel-tab-font-family: Menlo, Consolas, Monaco, Liberation Mono, Lucida Console, monospace;
\}
```
}\if{html}{\out{</div>}}
}

\section{Usage in R Markdown}{
Panelset works in all R Markdown HTML outputs like HTML reports and
\href{https://bookdown.org/yihui/blogdown/}{blogdown} webpages!

Panelset works in the same way as \code{rmarkdown}’s
\href{https://bookdown.org/yihui/rmarkdown-cookbook/html-tabs.html}{tabset}
feature, albeit with fewer style options, but the trade-off is that it
works in a wider range of document types; generally, as long as the
output is HTML, panelset should work.

Another advantage of panelset is that it enables deeplinking: the
currently shown tab is encoded in the URL automatically, allowing users
to link to open tabs. Users can also right click on a panel’s tab and
select \emph{Copy Link} to link directly to a specific panel’s tab, which
will appear in view when visiting the copied link.

With standard R Markdown,
i.e. \code{\link[rmarkdown:html_document]{rmarkdown::html_document()}}, you
can use the following template.\if{html}{\out{<div class="markdown">}}\preformatted{# Panelset In R Markdown! \{.panelset\}

## Tab One

Amet enim aptent molestie vulputate pharetra
vulputate primis et vivamus semper.

## Tab Two

### Sub heading one

Sit etiam malesuada arcu fusce ullamcorper
interdum proin tincidunt curabitur felis?

## Tab Three

Adipiscing mauris egestas vitae pretium 
ad dignissim dictumst platea!

# Another section

This content won't appear in a panel.
}\if{html}{\out{</div>}}

In other, less-standard R Markdown HTML formats, you can use pandoc’s
\href{https://pandoc.org/MANUAL.html#extension-fenced_divs}{fenced divs}.\if{html}{\out{<div class="markdown">}}\preformatted{::::: \{.panelset\}

::: \{.panel\}
[First Tab]\{.panel-name\}

Lorem sed non habitasse nulla donec egestas magna
enim posuere fames ante diam!
:::

::: \{.panel\}
[Second Tab]\{.panel-name\}

Consectetur ligula taciti neque scelerisque gravida
class pharetra netus lobortis quisque mollis iaculis.
:::

:::::
}\if{html}{\out{</div>}}

Alternatively, you can also use raw HTML.\if{html}{\out{<div class="html">}}\preformatted{<div class="panelset">
  <div class="panel">
    <div class="panel-name">First Tab</div>
    <!-- Panel content -->
    <p>Lorem ipsum, etc, etc</p>
  </div>
  <div class="panel">
    <div class="panel-name">Second Tab</div>
    <!-- Panel content -->
    <p>Lorem ipsum, etc, etc</p>
  </div>
</div>
}\if{html}{\out{</div>}}
}

