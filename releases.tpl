<html>
<head>
	<title>{{ title }}</title>
	<meta name="generator" value="{{ generator }}">
	<meta name="generator.time" value="{{ gentime }}">
	<meta name="charset" value="utf-8">

	<!-- use github styles directly, mirrored locally -->
	<link rel="stylesheet" href="github-assets/frameworks-4ba00b1aa0227e4b7a7961544c3b7938afb2720757a471735991ec4475c829e0.css" type="text/css">
	<link rel="stylesheet" href="github-assets/github-42867349e4de8b3f070c13c2000215d55817bb4c4087d3647e44cfe17649060b.css" type="text/css">
</head>
<body>

<!-- mimics the HTML from Github -->
<div role="main">

<div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
	<div class="container repohead-details-container">
		<h1 class="public">
			<svg aria-hidden="true" class="octicon octicon-repo" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"></path></svg>
			<span class="author" itemprop="author"><a href="https://github.com/{{global.author}}" class="url fn" rel="author">{{ global.author }}</a></span><!--
			--><span class="path-divider">/</span><strong itemprop="name"><a href="https://github.com/{{global.author}}/{{global.name}}" data-pjax="#js-repo-pjax-container">{{ global.name }}</a></strong><!--
		--></h1>
	</div>
</div>


<!-- main container -->
<div class="container new-discussion-timeline experiment-repo-nav">
<div class="repository-content">

<div id="readme" class="readme boxed-group clearfix announce instapaper_body md">
	<h3>
		<svg aria-hidden="true" class="octicon octicon-book" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M3 5h4v1H3V5zm0 3h4V7H3v1zm0 2h4V9H3v1zm11-5h-4v1h4V5zm0 2h-4v1h4V7zm0 2h-4v1h4V9zm2-6v9c0 .55-.45 1-1 1H9.5l-1 1-1-1H2c-.55 0-1-.45-1-1V3c0-.55.45-1 1-1h5.5l1 1 1-1H15c.55 0 1 .45 1 1zm-8 .5L7.5 3H2v9h6V3.5zm7-.5H9.5l-.5.5V12h6V3z"></path></svg>
		<span class="float-right">Generated at  {{gentime}}</span>
		{{ readme.title }}
	</h3>
	<article class="markdown-body entry-content">
		{{ readme.text }}
	</article>
</div>


<div class="release-timeline">

{% for release in releases %}
<div class="release label-">

	<!-- box on left -->
	<div class="release-meta">
		<!-- <span class="release-label latest">foo</span> -->

		<ul class="tag-references">
			<li><a href="{{ release.html_url }}">
				<svg aria-hidden="true" class="octicon octicon-tag" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M7.73 1.73C7.26 1.26 6.62 1 5.96 1H3.5C2.13 1 1 2.13 1 3.5v2.47c0 .66.27 1.3.73 1.77l6.06 6.06c.39.39 1.02.39 1.41 0l4.59-4.59a.996.996 0 0 0 0-1.41L7.73 1.73zM2.38 7.09c-.31-.3-.47-.7-.47-1.13V3.5c0-.88.72-1.59 1.59-1.59h2.47c.42 0 .83.16 1.13.47l6.14 6.13-4.73 4.73-6.13-6.15zM3.01 3h2v2H3V3h.01z"></path></svg>
				{{ release.tag_name }}
			</a></li>
			<li>
				<svg aria-hidden="true" class="octicon octicon-git-commit" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M10.86 7c-.45-1.72-2-3-3.86-3-1.86 0-3.41 1.28-3.86 3H0v2h3.14c.45 1.72 2 3 3.86 3 1.86 0 3.41-1.28 3.86-3H14V7h-3.14zM7 10.2c-1.22 0-2.2-.98-2.2-2.2 0-1.22.98-2.2 2.2-2.2 1.22 0 2.2.98 2.2 2.2 0 1.22-.98 2.2-2.2 2.2z"></path></svg>
				{{ release.target_commitish }}
			</li>
		</ul>
	</div>
	<!-- main box -->
	<div class="release-body commit open">
		<div class="release-header">
			<h1 class="release-title"><a href="{{ release.html_url }}">{{ release.name }}</a></h1>
			<p class="release-authorship">
					<img class="avatar" src="{{release.author.avatar_url}}" width="20" height="20">
					<a href="{{release.author.url}}">{{ release.author.login }}</a>
					released this on
					{{ release.published_at }}.
			</p>
		</div>
		<div class="markdown-body">
			<p>{{ release.body }}</p>
		</div>

		<h2 class="release-downloads-header">Downloads</h2>
		<ul class="release-downloads">
		{% for asset in release.assets %}
			<li><a href="{{ asset.browser_download_url }}">
				<small class="text-gray float-right"><span class="Counter">{{ asset.download_count }}</span> downloads</small>
				<svg aria-hidden="true" class="octicon octicon-package text-gray" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M1 4.27v7.47c0 .45.3.84.75.97l6.5 1.73c.16.05.34.05.5 0l6.5-1.73c.45-.13.75-.52.75-.97V4.27c0-.45-.3-.84-.75-.97l-6.5-1.74a1.4 1.4 0 0 0-.5 0L1.75 3.3c-.45.13-.75.52-.75.97zm7 9.09l-6-1.59V5l6 1.61v6.75zM2 4l2.5-.67L11 5.06l-2.5.67L2 4zm13 7.77l-6 1.59V6.61l2-.55V8.5l2-.53V5.53L15 5v6.77zm-2-7.24L6.5 2.8l2-.53L15 4l-2 .53z"></path></svg>
				<strong>{{ asset.name }}</strong>
			</li></a>
		{% endfor %}

			<!-- further information -->
			<li><a href="{{ release.zipball_url }}">
				<small class="text-gray float-right">No download statistics available</small>
				<svg aria-hidden="true" class="octicon octicon-file-zip text-gray" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M8.5 1H1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V4.5L8.5 1zM11 14H1V2h3v1h1V2h3l3 3v9zM5 4V3h1v1H5zM4 4h1v1H4V4zm1 2V5h1v1H5zM4 6h1v1H4V6zm1 2V7h1v1H5zM4 9.28A2 2 0 0 0 3 11v1h4v-1a2 2 0 0 0-2-2V8H4v1.28zM6 10v1H4v-1h2z"></path></svg>
				&nbsp;Sourcecode as Zip
			</li>
			<li><a href="{{ release.tarball_url }}">
				<small class="text-gray float-right">No download statistics available</small>
				<svg aria-hidden="true" class="octicon octicon-file-zip text-gray" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M8.5 1H1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V4.5L8.5 1zM11 14H1V2h3v1h1V2h3l3 3v9zM5 4V3h1v1H5zM4 4h1v1H4V4zm1 2V5h1v1H5zM4 6h1v1H4V6zm1 2V7h1v1H5zM4 9.28A2 2 0 0 0 3 11v1h4v-1a2 2 0 0 0-2-2V8H4v1.28zM6 10v1H4v-1h2z"></path></svg>
				&nbsp;Sourcecode as Tarball
			</li>
		</ul>
	</div>
</div><!--/release-->
{% endfor %}
