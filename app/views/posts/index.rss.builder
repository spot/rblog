xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Nu2Rails Blog"
    xml.description "My adventure into Ruby on Rails"
    xml.link formatted_posts_url(:rss)

    for post in Post.find(:all, :conditions => ["publish = ?", true], :limit => 10, :order => "created_at DESC")
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link formatted_posts_url(post, :rss)
        xml.guid formatted_posts_url(post, :rss)
      end
    end
  end
end
