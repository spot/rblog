atom_feed(:url => formatted_posts_url(:atom)) do |feed|
    feed.title("Nu2Rails")
    feed.updated(@posts.first ? @posts.first.created_at : Time.now.utc)
  
    for post in @posts
      feed.entry(post) do |entry|
        entry.title(post.title)
        entry.content(post.body, :type => 'html')
      end
    end
  end