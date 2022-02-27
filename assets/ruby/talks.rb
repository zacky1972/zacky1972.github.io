### talks.rb
###

require 'liquid'
require 'yaml'
require 'pp'
require 'date'

def loadYAML(filename)
	#YAML.load(File.read(filename), :encoding => Encoding::UTF_8)
	YAML.load(File.read(filename))
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
  {{ talk.num }}. 
  <a name="Podcast{{ talk.num }}"></a> 
  <audio id="my-audio{{ talk.num }}">
    <source src="{{ file_dir }}{{ talk.file }}.mp3" type="audio/mpeg">
    <p>{{ talk.date }} {{ talk.title }}</p>
  </audio>
  <button id="play{{ talk.num }}">play</button>
  <button id="pause{{ talk.num }}">pause</button>
  <script>
    window.onload = function(){

      var myAudio = document.getElementById('my-audio{{ talk.num }}');
      var play = document.getElementById('play{{ talk.num }}');
      var pause = document.getElementById('pause{{ talk.num }}');

      // associate functions with the 'onclick' events
      play.onclick = playAudio;
      pause.onclick = pauseAudio;

      function playAudio() {
        myAudio.play();
      }
  
      function pauseAudio() {
        myAudio.pause();
      }
    }
  </script>
  {% if talk.Facebook %}
    <a href="{{Facebook}}permalink/{{talk.Facebook}}/" target="_blank">Facebook</a>
  {% endif %}
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
<rss version="2.0">
  <channel>
    <title>{{ title }}</title>
    <description>{% if summary %}{{ summary | xml_escape }}{% endif %}</description>
    <link>{{ link }}</link>
    <language>ja-jp</language>
{% for talk in talks %}
      <item>
        <title>{{ talk.date }} {{ talk.title }}</title>
        <description> {{ talk.title | xml_escape }} </description>
        <pubDate>{{ talk.time }}</pubDate>
        <guid isPermaLink="true">{{ link }}#Podcast{{ talk.num }}</guid>
        <link>{{ link }}#Podcast{{ talk.num }}</link>
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

puts 'loadYAML'
talks = loadYAML("../talks/talks.yaml")
puts 'getLengthAndTime'
getLengthAndTime(talks)
puts 'renderMD'
renderMD(talks)
puts 'renderPodcast'
renderPodcast(talks)
puts 'renderRSS'
renderRSS(talks)
