class ArchiveSweeper < ActionController::Caching::Sweeper
  observe Archive
  observe Post
  
  def after_save(archive)
    expire_cache(archive)
  end
  
  def after_destroy(archive)
    expire_cache(archive)
  end
  
  def expire_cache(archive)
    expire_fragment 'archive_list'
  end
end

