### talks.rb
###

require 'liquid'
require 'yaml'
require'pp'

def loadYAML(filename)
	YAML.load(File.read(filename), :encoding => Encoding::UTF_8)
end

def rendorMD(talks)
	template = Liquid::Template.parse(<<"EOS"
---
title: {{title}}
layout: default
permalink: talks/index.html
---
# {{title}}

{% for talk in talks %}
{{ talk.num }}. [{{ talk.date }} {{ talk.title }}]({{ file_dir }}{{ talk.file }}.mp3) [Facebook]({{Facebook}}permalink/{{talk.Facebook}}/)
{% endfor %}

## ラジオ番組出演

{% for talk in radio %}
* [{{ talk.date }} {{ talk.title }}]({{ talk.link }})
{% endfor %}
EOS
	)
	File.open("../../talks.md", "w") do |io|
		p io.puts template.render(talks)
	end
end

talks = loadYAML("../talks/talks.yaml")
rendorMD(talks)
