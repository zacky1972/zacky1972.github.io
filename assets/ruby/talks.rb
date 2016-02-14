### talks.rb
###

require 'liquid'
require 'yaml'
require 'pp'
require 'date'

def loadYAML(filename)
	YAML.load(File.read(filename), :encoding => Encoding::UTF_8)
end

def render(file, template, talks)
	File.open(file, "w") do |io|
		p io.puts template.render(talks)
	end
end

def renderMD(talks)
	template = Liquid::Template.parse(<<"EOS"
---
title: {{title}}
layout: talks
permalink: /talks/index.html
---
# {{title}}

## ラジオ番組出演

{% for talk in radio %}
* <a name="radio{{ talk.date }}"></a>[{{ talk.date }} {{ talk.title }}]({{ talk.link }})
{% endfor %}

## Podcast 

[![Podcast]({{ RSS_img }}) Podcast]({{ Podcast }})
[![Get it on iTunes]({{ iTunes_svg }}) iTunes]({{ iTunes }})

{% for talk in talks %}
{{ talk.num }}. <a name="Podcast{{ talk.num }}"></a><a href="{{ file_dir }}{{ talk.file }}.mp3" target="_blank" onclick="ga('send', 'pageview', {'page': '{{ file_dir_short }}{{ talk.file }}.mp3', 'title':'{{ talk.file }}'});">{{ talk.date }} {{ talk.title }}</a> <a href="{{Facebook}}permalink/{{talk.Facebook}}/" target="_blank">Facebook</a>
{% endfor %}

EOS
		)
	render("../../talks/index.md", template, talks)
end

def renderPodcast(talks)
	template = Liquid::Template.parse(<<"EOS"
---
---
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
  <channel>
    <title>{{ title }}</title>
    <link>{{ link }}</link>
    <language>{{ language }}</language>
    <copyright>&#xA9; {{ author }} </copyright>
    <itunes:subtitle>{{ summary }}</itunes:subtitle>
    <itunes:author>{{ author }}</itunes:author>
    <itunes:summary>{{ summary }}</itunes:summary>
    <description>{{ summary }}</description>
    <itunes:owner>
      <itunes:name>{{ author }}</itunes:name>
      <itunes:email>{{ email }}</itunes:email>
    </itunes:owner>
    <itunes:image href="{{ image }}" />
    <itunes:category text="{{ category }}" />
{% for talk in talks %}
    <item>
      <title>{{ talk.date }} {{ talk.title }}</title>
      <itunes:author>{{ author }}</itunes:author>
      <itunes:subtitle> {{ talk.title }}</itunes:subtitle>
      <itunes:summary><![CDATA[ {{ talk.title }} <a href="{{Facebook}}permalink/{{talk.Facebook}}/" target="_blank">Facebook</a>]]></itunes:summary>
      <itunes:image href="{{ image }}" />
      <enclosure url="{{ file_dir }}{{ talk.file }}.mp3" length="{{ talk.length }}" type="audio/mpeg" />
      <guid isPermaLink="true">{{ file_dir }}{{ talk.file }}.mp3</guid>
      <pubDate>{{ talk.time }}</pubDate>
    </item>
{% endfor %}
  </channel>
</rss>
EOS
		)
	render("../../podcast.xml", template, talks)
end

def renderRSS(talks)
  template = Liquid::Template.parse(<<"EOS"
---
---
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/">
  <channel>
    <title>{{ title }}</title>
    <description>{% if summary %}{{ summary | xml_escape }}{% endif %}</description>
    <link>{{ link }}</link>
    <atom:link href="{{ link }}/feed.xml" rel="self" type="application/rss+xml" />
{% for talk in talks %}
      <item>
        <title>{{ talk.date }} {{ talk.title }}</title>
        <dc:creator>{{ author | xml_escape }}</dc:creator>
        <description> {{ talk.title | xml_escape }} </description>
        <pubDate>{{ talk.time }}</pubDate>
        <guid isPermaLink="true">{{ link }}#Podcast{{ talk.num }}</guid>
      </item>
{% endfor %}    
  </channel>
</rss>
EOS
    )
  render("../../talks/feed.xml", template, talks)
end

def getLengthAndTime(talks)
	talks["talks"].each{|talk|
		file = talks["path"] + talk["file"] + ".mp3"
		talk["length"] = File.size(file)
		talk["time"] = talk["date"].rfc822
	}
end

talks = loadYAML("../talks/talks.yaml")
getLengthAndTime(talks)
renderMD(talks)
renderPodcast(talks)
renderRSS(talks)
