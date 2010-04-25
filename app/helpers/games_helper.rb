module GamesHelper

  def box_logo(game, size = :thumb, options = { :prototip => false, :tooltip => false, :hover => false })
    h = options[:hover] ? "hover" : ""
    return image_tag(game.boxart.url(size), :alt => game.main_title, :name => game.full_title_colon_limit+"("+game.platform.short_name.upcase+")", :class => "boxart #{size.to_s} #{h}") unless (options[:prototip] or options[:tooltip])
    return image_tag(game.boxart.url(size), :alt => game.main_title, :name => game.full_title_colon_limit+"("+game.platform.short_name.upcase+")", :class => "boxart #{size.to_s} #{h}", :onmouseover => "tooltipAjax(event, this, #{game.id});") if (options[:prototip] and not options[:tooltip])
    return image_tag(game.boxart.url(size), :alt => game.main_title, :name => game.full_title_colon_limit+"("+game.platform.short_name.upcase+")", :class => "boxart #{size.to_s} #{h}", :onmouseover => "Ntip(this.name);", :onmouseout => "UnTip()", :onclick => "UnTip()") if (not options[:prototip] and options[:tooltip])
    return image_tag(game.boxart.url(size), :alt => game.main_title, :name => game.full_title_colon_limit+"("+game.platform.short_name.upcase+")", :class => "boxart #{size.to_s} #{h}", :onmouseover => "tooltipAjax(event, this, #{game.id});Ntip(this.name);", :onmouseout => "UnTip()", :onclick => "UnTip()") if (options[:prototip] and options[:tooltip])
  end

  def rating_logo(rating)
    image_tag("ratings/" + rating.logo_filename, :alt => rating.name, :class => "rating_logo")
  end
end
