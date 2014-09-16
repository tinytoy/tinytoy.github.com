#
# post_original_block_filter.rb
# Append author and copyright block to the end of every post
# lslin
# 2013.12.05
#
require './plugins/post_filters'

module AppendOriginBlockFilter
  def append(post)
    siteTitle = post.site.config['title']
    siteUrl = post.site.config['url']
   post.content + %Q[<br/><p>转载请注明：<a href='#{siteUrl}'>#{siteTitle}</a> &raquo; <a href='#{post.full_url}'>#{post.full_url}</a></p>]
  end 
end

module Jekyll
  class AppendOriginalBlock < PostFilter
    include AppendOriginBlockFilter
    def pre_render(post)
      post.content = append(post) if post.is_post?
    end
  end
end

Liquid::Template.register_filter AppendOriginBlockFilter
