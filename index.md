---
title: ZACKY's Laboratory
layout: default
---
# ZACKY のブログへようこそ！

<!--[ビジョンとミッション](/vision-mission.html)-->

<ul>
	{% for post in site.posts %}
		<li>
			{{post.date}}
			<a href="{{ post.url }}"> {{post.title}}</a>
			{{ post.excerpt }}
		</li>
	{% endfor %}
</ul>

```ruby
class A
  def one
    1
  end
end
```

{% highlight c %}
#include<stdio.h>

int main(int argc, char *argv[]) {
	return 0;
}
{% endhighlight %}
