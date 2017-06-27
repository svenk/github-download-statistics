#!/usr/bin/python
#
# Reads out download stat file from Github
#

# Dependencies: jinja2
import jinja2

# batteries
import urllib2, json, io, datetime, os

class json_tpl:
	"""
	A classy interface to a JSON web API
	"""
	def __init__(self, url):
		self.url = url
		response = urllib2.urlopen(self.url)
		self.strdata = response.read()
		self.data = json.loads(self.strdata)

	def dump(self, targetfile):
		with open(targetfile, "w") as text_file:
			text_file.write(self.strdata)

	def render(self, tplfile, outfile=None, json_key="data", further_context={}):
		context = { json_key: self.data }
		context.update(further_context)
		path, filename = os.path.split(tplfile)
		generated_text = jinja2.Environment(
			loader=jinja2.FileSystemLoader(path or './')
		).get_template(filename).render(context)
		if outfile:
			with io.open(outfile, "w") as text_file:
				text_file.write(generated_text)
		return generated_text

username = 'exahype'
project = 'exahype'

release_api_url = "https://api.github.com/repos/%s/%s/releases" % (username, project)
release_web_url = "https://github.com/%s/%s/releases" % (username, project)

release_dump_file = "release-stats.json"
release_stats = json_tpl(release_api_url)
release_stats.dump(release_dump_file)

title = 'Download statistics for ExaHyPE releases'
gentime = datetime.datetime.now().strftime('%c')
further_info = {
	# html-global information
	'gentime': gentime,
	'title': title,
	'generator': 'python-jinja-github-api by SvenK',

	# github template specific
	'global': { 'author': username, 'name': project },

	# readme box
	'readme': { 'title': title, 'text': """
		This page mirrors the information shown at the
		<a href="%(release_web_url)s">ExaHyPE github release page</a> and enriches
		them with the download log information available throught
		<a href="https://developer.github.com/v3/">Github's API</a>. This very page
		mimics the layout of the official Github page but all information come from
		the API. Raw data for setting up this page are available at
		<a href="%(release_dump_file)s">%(release_dump_file)s</a>. Note the generation
		date (latest update) of this file which is <em>%(gentime)s</em>, ie. this
		file might be probably out of sync if nobody updated it.
		<br>See <a href="https://github.com/svenk/github-download-statistics">https://github.com/svenk/github-download-statistics</a>
		for further information about this code.
	""" % globals() }
}

out = release_stats.render("releases.tpl", "index.html", json_key="releases", further_context = further_info)

print out

# done

