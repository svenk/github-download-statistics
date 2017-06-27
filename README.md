# Generate public github download statistics overviews

This repository is a quick approach to implement download statistics for any Github releases.
They are obtained via the Github API and no special permissions are neccessary to do this, ie.
you can obtain them without logging in.

## Example

Inspect the `index.html` which is actually from the
[Github exahype/exahype releases page](http://github.com/exahype/exahype/releases)
and published online at http://dev.exahype.eu/download in case you have difficulties
to view it on the browser.

## Architecture

If you inspect the single Python script, you see this is supersimple. The algorithm is like

  * Download the public available project releases information via Github API as Json
  * Feed the JSON directly to the [Jinja](http://jinja.pocoo.org/) template engine
  * Render the HTML file which mimics closely the Github page.

## Development

This is handy for rerendering the page (ie. REPL -- edit in your editor, save, click refresh
in your browser, as it would be a server-side rendering):

```
while inotifywait -e close_write ./releases.tpl generate-download-page.py;  do python generate-download-page.py; done
```