class CategorySweeper < ActionController::Caching::Sweeper
  observe Category
  observe Post

  def after_save(category)
    expire_cache(category)
  end

  def after_destroy(category)
    expire_cache(category)
  end

  def expire_cache(category)
    expire_fragment 'cat_list'
  end
end