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
layout: default
permalink: talks/index.html
---
# {{title}}

## ラジオ番組出演

{% for talk in radio %}
* <a name="radio{{ talk.date }}"></a>[{{ talk.date }} {{ talk.title }}]({{ talk.link }})
{% endfor %}

## Podcast 

[![Podcast](https://zacky1972.github.io/assets/images/ico-blog.png) Podcast]({{ Podcast }})

{% for talk in talks %}
{{ talk.num }}. <a name="Podcast{{ talk.num }}"></a>[{{ talk.date }} {{ talk.title }}]({{ file_dir }}{{ talk.file }}.mp3) [Facebook]({{Facebook}}permalink/{{talk.Facebook}}/)
{% endfor %}

EOS
		)
	render("../../talks.md", template, talks)
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
      <itunes:summary><![CDATA[ {{ talk.title }} <a href="{{Facebook}}permalink/{{talk.Facebook}}/">Facebook</a>]]></itunes:summary>
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
