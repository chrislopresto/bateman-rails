module EmberAppHelper
  def ember_app_meta_tags
    return unless @ember_app_metas

    @ember_app_metas.collect do |meta|
      content_tag :meta, nil, name: meta['name'], content: meta['content']
    end.join.html_safe
  end

  def ember_app_link_tags
    return unless @ember_app_links

    @ember_app_links.collect do |link|
      stylesheet_link_tag link['href']
    end.join.html_safe
  end

  def ember_app_script_tags
    return unless @ember_app_scripts

    @ember_app_scripts.collect do |script|
      javascript_include_tag script['src']
    end.join.html_safe
  end
end
